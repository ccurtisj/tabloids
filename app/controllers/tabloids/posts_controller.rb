module Tabloids
  class PostsController < ApplicationController
    layout 'tabloids_public'
   
    before_filter :load_post, :only => [:show]
  
    def index
      @posts = Post.published
    end
    
    def show
    end
  
    private
  
    def load_post
      @post = Post.for_token(params[:id]) || Post.find(params[:id])
    end
  end
end