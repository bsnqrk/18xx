# frozen_string_literal: true

require_relative '../../../step/dividend'

module Engine
  module Game
    module G18Ardennes
      module Step
        class Dividend < Engine::Step::Dividend
          def payout(entity, revenue)
            return half(entity, revenue) if entity.type == :minor

            super
          end

          def half(_entity, revenue)
            withheld = (revenue / 2.0).ceil
            { corporation: withheld, per_share: revenue - withheld }
          end

          def share_price_change(entity, revenue = 0)
            price = entity.share_price.price
            revenue *= 2 if entity.type == :minor

            if revenue.zero?
              { share_direction: :left, share_times: 1 }
            elsif (revenue >= price * 2) && (entity.type != :'10-share')
              { share_direction: :right, share_times: 2 }
            elsif revenue >= price
              { share_direction: :right, share_times: 1 }
            else
              {}
            end
          end
        end
      end
    end
  end
end
