# frozen_string_literal: true

module Engine
  module Game
    module G18Uruguay
      module Step
        class DestinationBonus < Engine::Step::Base
          ACTIONS = %w[destination_connection pass].freeze

          def description
            'Destination Bonus'
          end

          def log_skip(entity)
            return unless entity.corporation?
            return if entity == @game.rptla
            return unless destination_node_check?(entity)

            super
          end

          def actions(entity)
            return [] if entity.minor?
            return [] if entity == @game.rptla
            return [] if @game.abilities(entity, :destination_bonus).nil?

            self.class::ACTIONS
          end

          def auto_actions(entity)
            return [] unless entity.corporation?
            return [Engine::Action::Pass.new(entity)] unless destination_node_check?(entity)

            [Engine::Action::DestinationConnection.new(entity, corporations: [entity])]
          end

          def destination_node_check?(corporation)
            return false if corporation.closed?
            return false if corporation.destination_coordinates.nil?

            ability = @game.abilities(corporation, :destination_bonus)
            return false if ability.nil?

            destination_hex = @game.hex_by_id(corporation.destination_coordinates)
            home_node = corporation.tokens.first.city

            destination_hex.tile.nodes.first&.walk(corporation: corporation) do |path, _, _|
              return true if path.nodes.include?(home_node)
            end
            false
          end

          def check_and_apply_destination_bonus(corporation)
            apply_destination_bonus(corporation) if destination_node_check?(corporation)
          end

          def apply_destination_bonus(corporation)
            ability = @game.abilities(corporation, :destination_bonus)
            @game.second_capitalization!(corporation) unless ability.nil?
            ability&.use!
          end

          def process_destination_connection(action)
            action.corporations.each { |corporation| check_and_apply_destination_bonus(corporation) }

            pass!
          end
        end
      end
    end
  end
end
