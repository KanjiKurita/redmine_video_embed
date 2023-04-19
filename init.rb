require 'redmine'
require_dependency 'redmine/wiki_formatting/textile/formatter'

Redmine::Plugin.register :redmine_video_embed do
  name 'Redmine Video Embed Plugin'
  author 'Kanji Kurita'
  description 'A plugin to automatically embed videos in comments by drag-and-drop'
  version '0.0.1'
end
