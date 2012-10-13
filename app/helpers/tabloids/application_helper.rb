module Tabloids
  module ApplicationHelper
    def all_post_tags
      @all_post_tags ||= Post.all_tags.collect{|tag_hash| tag_hash[:name]}.flatten
    end
  end
end