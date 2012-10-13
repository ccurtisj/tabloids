module Tabloids
  class Engine < ::Rails::Engine
    
    config.to_prepare do
      ApplicationController.helper(::Tabloids::ApplicationHelper)
    end
    
    initializer "static assets" do |app|
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
    end
  end
end