module Tabloids
  module ApplicationHelper
    def all_post_tags
      @all_post_tags ||= Post.all_tags.collect{|tag_hash| tag_hash[:name]}.flatten
    end
    
    def all_post_tags_json
      all_post_tags.to_json
    end
  end
end