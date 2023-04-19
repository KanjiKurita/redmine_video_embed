module Redmine
    module WikiFormatting
      module Textile
        class Formatter
          def initialize(*args)
            super
            add_video_embed_rule
          end
  
          def add_video_embed_rule
            @rules ||= []
            @rules << :inline_video_embed
          end
  
          def inline_video_embed(text)
            text.gsub!(/(!video\((.+?)\)!)/) do |_|
              video_url = $2
              "<video controls src=\"#{video_url}\" style=\"max-width:100%; height:auto;\"></video>"
            end
          end
        end
      end
    end
  end
  