module Tabloids
  class Category

    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :name, :type => String
    
    has_many :posts, :class_name => 'Tabloids::Post'
  end
end