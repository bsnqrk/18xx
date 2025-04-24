# frozen_string_literal: true

require_relative '../../../step/special_buy'

module Engine
  module Game
    module G18HN
      module Step
        class SpecialBuy < Engine::Step::SpecialBuy
          attr_reader :nassau_item, :darmstadt_item, :kassel_item, :waldeck_item, :frankfurt_item

          def buyable_items(entity)
            items = []
            items << @nassau_item if @game.can_buy_nassau_right?(entity)
            #items << @darmstadt_item if @game.can_buy_bridge_token?(entity)
            #items << @kassel_item if @game.can_buy_tunnel_token?(entity)
            #items << @waldeck_item if @game.can_buy_bridge_token?(entity)
            #items << @frankfurt_item if @game.can_buy_tunnel_token?(entity)

            items
          end

          def short_description
            'Concessions & Rights'
          end

          def process_special_buy(action)
            item = action.item
            #return @game.buy_nassau_right(action.entity) if item == @nassau_item

            raise GameError, "Cannot buy unknown item: #{item.description}"
          end

          def setup
            super
            @nassau_item ||= Item.new(description: 'Nassau Concession', cost: 40)
            @darmstadt_item ||= Item.new(description: 'Darmstadt Concession', cost: 40)
            @waldeck_item ||= Item.new(description: 'Waldeck Concession', cost: 40)
            @kassel_item ||= Item.new(description: 'Kassel Concession', cost: 40)
            @frankfurt_item ||= Item.new(description: 'Frankfurt right', cost: 40)
          end
        end
      end
    end
  end
end
