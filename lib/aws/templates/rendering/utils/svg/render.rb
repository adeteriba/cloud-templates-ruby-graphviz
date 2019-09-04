require 'aws/templates/utils'
require 'erb'
require 'nokogiri'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          #
          #  Graph Render
          class Render < Aws::Templates::Rendering::Render
            include Aws::Templates::Utils::Parametrized

            def self.getter
              as_is
            end

            parameter :is_compact,
                      description: 'Compact display mode',
                      transform: as_boolean

            parameter :hide_composites,
                      description: 'Plot clusters for composites',
                      transform: as_boolean

            protected

            def post_process(rendered)
              rendered.graph
            end

            def formatted_for(graph)
              template = ERB.new(load_asset('template.html.erb'))
              javascript = load_asset('javascript.js')
              css = load_asset('jquery-ui.css')
              image = graph.render 'svg'
              id = Nokogiri::XML(image)
              tag = id.at_xpath '//xmlns:svg'
              tag['id'] = 'svg-id'
              svg = id.to_xml
              template.result(binding)
            end

            def load_asset(name)
              File.open(
                File.expand_path(File.join(__dir__, 'erb', name))
              ).read
            end
          end
        end
      end
    end
  end
end
