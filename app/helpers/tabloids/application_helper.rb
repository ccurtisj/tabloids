module Tabloids
  module ApplicationHelper
    def all_post_tags
      @all_post_tags ||= load_all_tags
    end
    
    def all_post_tags_json
      all_post_tags.to_json
    end
    
    def header_for_posts_index(options = {})
      if options[:category]
        options[:category].name
      elsif options[:tag]
        options[:tag].capitalize
      else
        "All Posts"
      end
    end
    
    private
    
    def load_all_tags
      Post.count < 1 ? [] : 
      Post.all_tags.collect{|tag_hash| tag_hash[:name]}.flatten
    end
  end
end