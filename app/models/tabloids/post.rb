module Tabloids
  class Post
    include Mongoid::Document
    include Mongoid::Document::Taggable
    include Mongoid::Timestamps

    field :published,           :type => Mongoid::Boolean, :default => false

    field :url_friendly_token,  :type => String
    field :content,             :type => String
    field :title,               :type => String

    field :published_at,        :type => Time

    scope :for_category, ->(category){ where(:category_id => category.id) }
    scope :newest_first, desc(:published_at)
    scope :published, where(:published => true)

    belongs_to :category, class_name: 'Tabloids::Category'

    validates_presence_of :title
    validates_presence_of :content
    validates_uniqueness_of :title

    before_save :update_published_at
    before_save :generate_url_friendly_token

    def self.for_token(token)
      self.where(:url_friendly_token => token).first
    end

    protected

    # Needs a better name
    def new_url_friendly_token
      self.title.downcase.gsub(/\.|!|,|:|\/|\\|"|'|\?/, "").gsub(/\s+/, '-')
    end

    private

    def generate_url_friendly_token
      if self.published && self.url_friendly_token.blank?
        self.url_friendly_token = self.new_url_friendly_token
      end
    end

    def update_published_at
      self.published_at = Time.now if self.published && self.published_changed?
    end
  end
end
