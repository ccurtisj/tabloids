module Tabloids
  class Category

    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :name, :type => String
    field :guid, :type => String
    
    index(:name => 1)
    index(:guid => 1)
    
    has_many :posts, :class_name => 'Tabloids::Post'
    
    validates_presence_of :name
    validates_presence_of :guid
    
    before_validation :update_the_guid
    
    private
    
    def update_the_guid
      self.guid = self.name.downcase.gsub(/\s+/, '-')
    end
  end
end