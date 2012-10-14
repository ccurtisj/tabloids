routes = lambda {
  scope :module => "tabloids" do
  # namespace :tabloids do
    
    resources :posts
  
    namespace :admin do
      resources :posts
      resources :categories
    end
  end
}

Rails.application.routes.draw &routes
Tabloids::Engine.routes.draw  &routes if Rails.env.test?