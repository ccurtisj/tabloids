require 'spec_helper'

module Tabloids
  
  describe "Categories", :type => :request do
    
    describe "GET /admin/categories" do
      it "displays all categories" do
        category = Fabricate(:category)
        visit admin_categories_path
        page.should have_content(category.name)
      end
    end
    
    describe "GET /admin/categories/new" do
      
      let!(:category) { Fabricate(:category) }
      
      before { visit new_admin_category_path }
      
      it "displays the edit form for the category" do
        page.should have_content('Add Category')
      end
      
      describe "successfully submitting the form" do
        it "creates a new category and redirects to the index" do
          fill_in 'category[name]', :with => 'foo'
          click_button 'Create Category'
          page.should have_content('foo')
        end
      end
    end
    
    describe "GET /admin/categories/edit" do
      
      let!(:category) { Fabricate(:category) }
      
      before { visit edit_admin_category_path(category) }
      
      it "displays the edit form for the category" do
        page.should have_content('Edit Category')
      end
      
      describe "successfully submitting the form" do
        it "updates a the category and redirects to the index" do
          fill_in 'category[name]', :with => 'bar'
          click_button 'Update Category'
          page.should have_content('bar')
        end
      end
    end
  end
end