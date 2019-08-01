require 'aws/templates/utils'
require 'set'

module Aws
  module Templates
    module Rendering
      module Utils
        module Svg
          module Html
            #
            # Artifact View
            class ArtifactView < Html::ParameterizedView
              for_entity Aws::Templates::Artifact

              protected

              def enumerator
                return super unless parent.is_compact

                {
                  type: instance.class.to_s,
                  label: instance.label
                }
              end
            end
          end
        end
      end
    end
  end
end
