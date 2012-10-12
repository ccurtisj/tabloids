require "spec_helper"

describe "Posts" do
  
  describe "GET /posts" do
    
    let!(:post1) { Fabricate(:post, :content => 'Content for post 1') }
    let!(:post2) { Fabricate(:post, :content => 'Content for post 2') }
    
    it "displays the title and preview text of all posts" do
      visit posts_path
      
      page.should have_content(post1.title)
      page.should have_content(post2.title)
      
      page.should have_content('Content for post 1')
      page.should have_content('Content for post 2')
    end
  end
end