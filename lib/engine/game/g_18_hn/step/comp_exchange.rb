# frozen_string_literal: true

require_relative '../../../step/base'

module Engine
  module Game
    module G18HN
      module Step
        class CompExchange < Engine::Step::Base
          ACTIONS = %w[choose].freeze
          CHOICES = { :form => 'form', :fold_in => 'fold_in', :decline => 'decline' }.freeze
        end
      end
    end
  end
end
