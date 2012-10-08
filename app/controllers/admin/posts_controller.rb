class Admin::PostsController < ApplicationController
  layout 'tabloids'
  
  responders :collection, :flash
  respond_to :html
  
  before_filter :load_post, :only => [:edit, :update]
  
  def create
    @post = Post.create(params[:post])
    respond_with(:admin, @post)
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
    respond_with(:admin, @post)
  end
  
  private
  
  def load_post
    @post = Post.find(params[:id])
  end
end