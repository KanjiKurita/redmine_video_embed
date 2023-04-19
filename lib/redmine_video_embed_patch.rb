# plugins/redmine_video_embed/lib/redmine_video_embed_patch.rb
module RedmineVideoEmbedPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method :initialize_without_video_embed, :initialize
      alias_method :initialize, :initialize_with_video_embed
    end
  end

  module InstanceMethods
    def initialize_with_video_embed(*args)
      initialize_without_video_embed(*args)
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

Redmine::WikiFormatting::Textile::Formatter.send(:include, RedmineVideoEmbedPatch)
