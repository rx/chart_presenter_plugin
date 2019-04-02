require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module Chart
        class Component < DSL::Components::EventBase
          attr_accessor :chart_options

          def initialize(**attribs_, &block)
            super(type: :chart, **attribs_, &block)
            @chart_options = {}
            %i(data color size grid regions legend tooltip padding transition point pie).each do |setting|
              @chart_options.merge!(setting=>attribs.delete(setting){{}})
            end
            expand!
          end
        end
      end
    end
  end
end
