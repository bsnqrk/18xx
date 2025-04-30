# frozen_string_literal: true

module Engine
  module Game
    module G18HN
      class Corporation < Engine::Corporation
        attr_accessor :concession

        def initialize(sym:, name:, **opts)
          super
          # display consession as an ability on corp card (condider idea of using type of "company" for consession)
          @consession = ''

        end
      end
    end
  end
end
