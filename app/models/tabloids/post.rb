module Tabloids
  class Post
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :title
    field :content
    field :published_at
  
    validates_presence_of :title
    validates_presence_of :content
  end
end