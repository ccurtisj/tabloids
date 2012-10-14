require 'spec_helper'

module Tabloids
  
  describe "Posts", :type => :request do
    
    describe "GET /admin/posts" do
      it "displays posts" do
        post = Fabricate(:post)
        visit admin_posts_path
        page.should have_content(post.title)
      end
    end
  end
end