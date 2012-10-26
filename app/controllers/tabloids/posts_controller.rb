module Tabloids
  class PostsController < ApplicationController
    
    layout 'tabloids_public'
    
    before_filter :load_category, :only => [:index]
    before_filter :load_post, :only => [:show]
    
    def index
      @posts = Post.published
      @posts = @posts.for_category(@category) if @category
    end
    
    def show
    end
  
    private
  
    def load_category
      return if params[:category_guid].blank?
      @category = Category.where(:guid => params[:category_guid]).first
    end
    
    def load_post
      @post = Post.for_token(params[:id]) || Post.find(params[:id])
    end
  end
end