Tabloids::Engine.routes.draw do
  resources :posts

  get '/categories/:category_guid' => 'posts#index', :as => 'category'
  get '/tags/:tag' => 'posts#index', :as => 'tag'

  namespace :admin do
    resources :posts
    resources :categories
  end
end