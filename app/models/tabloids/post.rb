module Tabloids
  class Post
    include Mongoid::Document
    include Mongoid::Document::Taggable
    include Mongoid::Timestamps
  
    field :published,     :type => Boolean, :default => false
    
    field :url_friendly_token, :type => String
    field :content,           :type => String
    field :title,             :type => String

    field :published_at,  :type => Time
    
    scope :for_category, ->(category){ where(:category_id => category.id) }
    scope :published, where(:published => true)
    
    belongs_to :category
  
    validates_presence_of :title
    validates_presence_of :content
    
    before_save :update_published_at
    before_save :generate_url_friendly_token
    
    def self.for_token(token)
      self.where(:url_friendly_token => token).first
    end
    
    protected
    
    def generate_url_friendly_token
      if self.published && self.url_friendly_token.blank?
        self.url_friendly_token = self.title.gsub(' ', '-').gsub(/\.|!|,|:/, "")
      end
    end
    
    def update_published_at
      self.published_at = Time.now if self.published && self.published_changed?
    end
  end
end