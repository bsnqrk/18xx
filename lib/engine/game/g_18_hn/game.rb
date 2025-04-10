# frozen_string_literal: true

require_relative 'entities'
require_relative 'map'
require_relative 'meta'
require_relative '../base'

module Engine
  module Game
    module G18HN
      class Game < Game::Base
        include_meta(G18HN::Meta)
        include G18HN::Entities
        include G18HN::Map

        register_colors(red: '#d1232a',
                        orange: '#f58121',
                        black: '#110a0c',
                        blue: '#025aaa',
                        lightBlue: '#8dd7f6',
                        yellow: '#ffe600',
                        green: '#32763f',
                        brightGreen: '#6ec037')

        GAME_END_CHECK = { bankrupt: :immediate, bank: :current_or }.freeze

        CURRENCY_FORMAT_STR = '%sM'

        STARTING_CASH = { 3 => 800, 4 => 600, 5 => 500 }.freeze

        SELL_AFTER = :after_sr_floated

        SELL_MOVEMENT = :down_block

        SELL_BUY_ORDER = :sell_buy

        CERT_LIMIT = { 3 => 29, 4 => 21, 5 => 17 }.freeze

        HOME_TOKEN_TIMING = :operate

        MARKET = [
          ['', '', '85', '90', '100p', '110', '120', '130', '140', '160', '180', '200', '225', '250', '275', '300', '325', '350',
           '375', '400'],
          ['', '75', '80', '85', '90p', '100', '110', '120', '130', '140', '160', '180', '200', '225', '250', '275', '300', '325',
           '350', '375'],
          %w[65 70 75 80 85p 90 100 110 120 130 140 160 180 200 225 250 275 300],
          %w[60 65 70 75 80p 85 90 100 110 120 130 140 160 180 200],
          %w[55 60 65 70 75p 80 85 90 100 110 120 130],
          %w[50 55 60 65 70p 75 80 85 90 100],
          %w[45 50 55 60 65 70 75 80],
          %w[40 45 50 55 60 65],
        ].freeze

        PHASES = [
          {
            name: '2',
            train_limit: 4,
            tiles: [:yellow],
            operating_rounds: 1,
          },
          {
            name: '3',
            on: '3',
            train_limit: 4,
            tiles: %i[yellow green],
            operating_rounds: 2,
          },
          {
            name: '4',
            on: '4',
            train_limit: 3,
            tiles: %i[yellow green],
            operating_rounds: 2,
          },
          {
            name: '5',
            on: '5',
            train_limit: 2,
            tiles: %i[yellow green brown],
            operating_rounds: 3,
          },
          {
            name: '6',
            on: '6',
            train_limit: 2,
            tiles: %i[yellow green brown],
            operating_rounds: 3,
          },
        ].freeze

        TRAINS = [
          {
            name: '2',
            distance: 2,
            price: 80,
            rusts_on: '4',
            num: 9,
            variants: [
              {
                name: '2+2',
                distance: [{ 'nodes' => ['town'], 'pay' => 2, 'visit' => 2 },
                           { 'nodes' => %w[city offboard town], 'pay' => 2, 'visit' => 2 }],
                price: 100,
              },
            ],
          },
          {
            name: '3',
            distance: 3,
            price: 150,
            rusts_on: '6',
            num: 6,
            variants: [
              {
                name: '3+3',
                distance: [{ 'nodes' => ['town'], 'pay' => 3, 'visit' => 3 },
                           { 'nodes' => %w[city offboard town], 'pay' => 3, 'visit' => 3 }],
                price: 180,
              },
            ],
          },
          {
            name: '4',
            distance: 4,
            price: 320,
            num: 5,
            variants: [
              {
                name: '4+4',
                distance: [{ 'nodes' => ['town'], 'pay' => 4, 'visit' => 4 },
                           { 'nodes' => %w[city offboard town], 'pay' => 4, 'visit' => 4 }],
                price: 400,
              },
            ],
          },
          {
            name: '5',
            distance: 5,
            price: 450,
            num: 4,
            events: [{ 'type' => 'close_companies' }],
            variants: [
              {
                name: '5+5',
                distance: [{ 'nodes' => ['town'], 'pay' => 5, 'visit' => 5 },
                           { 'nodes' => %w[city offboard town], 'pay' => 5, 'visit' => 5 }],
                price: 550,
              },
            ],
          },
          {
            name: '6',
            distance: 6,
            price: 600,
            num: 11,
            variants: [
              {
                name: '6+6',
                distance: [{ 'nodes' => ['town'], 'pay' => 6, 'visit' => 6 },
                           { 'nodes' => %w[city offboard town], 'pay' => 6, 'visit' => 6 }],
                price: 720,
              },
            ],
          },
        ].freeze

        def setup_preround
          # Make sure the start player order is randomized
          @players.sort_by! { rand }
        end

        def new_auction_round
          Round::Auction.new(self, [
            Step::SelectionAuction,
          ])
        end

        # Stock Round 1 is least_cash
        # Stock Round 2ff is after_last_to_act
        def next_round!
          @round =
            case @round
            when Round::Stock
              @operating_rounds = @phase.operating_rounds
              reorder_players
              new_operating_round
            when Round::Operating
              if @round.round_num < @operating_rounds
                or_round_finished
                new_operating_round(@round.round_num + 1)
              else
                @turn += 1
                or_round_finished
                or_set_finished
                new_stock_round
              end
            when init_round.class
              init_round_finished
              reorder_players(:least_cash)
              new_stock_round
            end
        end

        #         def setup_destinations
        #           @corporations.each do |c|
        #             next unless c.destination_coordinates
        #
        #             dest_hex = hex_by_id(c.destination_coordinates)
        #             ability = Ability::Base.new(
        #               type: 'base',
        #               description: "Destination: #{dest_hex.location_name} (#{dest_hex.name})",
        #             )
        #             c.add_ability(ability)
        #
        #             dest_hex.assign!(c)
        #           end
        #         end

        def operating_round(round_num)
          Round::Operating.new(self, [
            Engine::Step::Track,
            Engine::Step::Token,
            Engine::Step::Route,
            Engine::Step::Dividend,
            Engine::Step::DiscardTrain,
            Engine::Step::BuyTrain,
          ], round_num: round_num)
        end
      end
    end
  end
end
