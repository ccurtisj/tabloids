module Tabloids
  class Engine < ::Rails::Engine
    
    isolate_namespace Tabloids
    
    initializer "static assets" do |app|
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
    end
  end
end