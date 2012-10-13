require "spec_helper"

module Tabloids
  describe Admin::PostsController do
  
    describe "#create" do
      
      context "when it is successful" do
        
        before do
          post :create, :post => {:title => 'foo', :content => 'bar'}
        end
        
        it "creates a post" do
          post = Post.last
          post.title.should eq 'foo'
          post.content.should eq 'bar'
        end
        
        it "redirects to the #index page" do
          response.should redirect_to admin_posts_path
        end
      end
      
      context "when it is unsuccessful" do
        
        before do
          post :create, :post => {:title => '', :content => ''}
        end
        
        it "does not create a new post" do
          Post.count.should eq 0
        end
        
        it "renders the new template" do
          response.should render_template('new')
        end
      end
    
      context "with tags" do
        before { post :create, 
          :post => {
            :title => 'foo', 
            :content => 'bar',
            :tag_list => 'apple, orange, banana'
          }
        }
        
        subject { Post.last }
        
        its(:tags) { should include('apple') }
        its(:tags) { should include('orange') }
        its(:tags) { should include('banana') }
      end
    end
    
    describe "#destroy" do
    
      it "destroys a given post" do
        post = Tabloids::Post.create!(:title => 'lorem', :content => "ipsum")
        delete :destroy, :id => post.id
        Post.where(:id => post.id).should have(0).posts
      end
    end
  end
end