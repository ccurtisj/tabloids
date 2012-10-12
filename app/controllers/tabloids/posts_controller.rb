module Tabloids
  class PostsController < ApplicationController
    layout 'tabloids'
  
    # respond_to :html
    #   
    # before_filter :load_post, :only => [:edit, :update, :destroy]
  
    def index
      @posts = Post.all
    end
  
    private
  
    def load_post
      @post = Post.find(params[:id])
    end
  end
end