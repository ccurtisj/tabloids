module Tabloids
  class ::Tabloids::Admin::CategoriesController < ApplicationController
    layout 'tabloids_admin'
  
    responders :flash
    respond_to :html
  
    before_filter :load_category, :only => [:edit, :update, :destroy]
  
    def create
      @category = Category.create(params[:category])
      respond_with(:admin, @category, :location => admin_categories_path)
    end
      
    def edit
    end
      
    def index
      @categories = Category.all
    end
      
    def new
      @category = Category.new
    end
      
    def update
      @category.update_attributes(params[:category])
      respond_with(:admin, @category, :location => admin_categories_path)
    end
    # 
    # def destroy
    #   @post.destroy
    #   respond_with(:admin, @post, :location => admin_posts_path)
    # end
  
    private
  
    def load_category
      @category = Category.find(params[:id])
    end
  end
end