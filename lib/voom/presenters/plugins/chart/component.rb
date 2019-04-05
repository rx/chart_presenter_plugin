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
            %i(line spline step area area-spline area-step bar scatter pie donut gauge
               data axis color size grid regions legend tooltip padding transition point).each do |setting|
              value = attribs.delete(setting)
              @chart_options.merge!(setting=>value) if value
            end
            expand!
          end
        end
      end
    end
  end
end
