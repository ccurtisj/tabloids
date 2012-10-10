module Tabloids
  class Admin::PostsController < ApplicationController
    layout 'tabloids'
  
    responders :flash
    respond_to :html
  
    before_filter :load_post, :only => [:edit, :update, :destroy]
  
    def create
      @post = Post.create(params[:post])
      respond_with(:admin, @post, :location => admin_posts_path)
    end
  
    def edit
    end
  
    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new
    end
  
    def update
      @post.update_attributes(params[:post])
      respond_with(:admin, @post, :location => admin_posts_path)
    end
    
    def destroy
      @post.destroy
      respond_with(:admin, @post, :location => admin_posts_path)
    end
  
    private
  
    def load_post
      @post = Post.find(params[:id])
    end
  end
end