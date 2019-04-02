require_relative './chart/component'

module Voom
  module Presenters
    module Plugins
      module Chart
        module DSLComponents
          def chart(**attributes, &block)
            self << Chart::Component.new(parent: self, **attributes, &block)
          end
        end
        module WebClientComponents
          # The string returned from this method will be added to the HTML header section of the page layout
          # It will be called once for the page.
          # The pom is passed along with the sinatra render method.
          def render_header_chart(_pom, render:)
            view_dir = File.join(__dir__, 'chart')
            render.call :erb, :header, views: view_dir
          end

          def render_chart(comp,
                           render:,
                           components:,
                           index:)
            view_dir = File.join(__dir__, 'chart')
            render.call :erb, :chart, views: view_dir,
                        locals: {comp: comp,
                                 components: components, index: index}
          end
        end
      end
    end
  end
end
