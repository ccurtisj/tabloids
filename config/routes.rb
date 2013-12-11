routes = lambda {
  scope :module => "tabloids" do

    get '/categories/:category_guid' => 'posts#index', :as => 'category'
    get '/tags/:tag' => 'posts#index', :as => 'tag'

    namespace :admin do
      resources :posts
      resources :categories
    end
    resources :posts
  end
}

Rails.application.routes.draw &routes
Tabloids::Engine.routes.draw  &routes if Rails.env.test?