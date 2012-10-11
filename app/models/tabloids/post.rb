module Tabloids
  class Post
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :published,     :type => Boolean, :default => false
    field :title,         :type => String
    field :content,       :type => String
    field :published_at,  :type => Time
  
    validates_presence_of :title
    validates_presence_of :content
    
    before_save :update_published_at
    
    private
    
    def update_published_at
      self.published_at = Time.now if self.published && self.published_changed?
    end
  end
end