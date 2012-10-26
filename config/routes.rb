routes = lambda {
  scope :module => "tabloids" do
    
    match '/categories/:category_guid', :to => 'posts#index', :as => 'category'
    match '/tags/:tag', :to => 'posts#index', :as => 'tag'
    
    namespace :admin do
      resources :posts
      resources :categories
    end
    resources :posts
  end
}

Rails.application.routes.draw &routes
Tabloids::Engine.routes.draw  &routes if Rails.env.test?