require "spec_helper"

describe "Posts" do
  
  describe "GET /posts" do
    
    let!(:post1) { Fabricate(:post, :content => 'Content for post 1') }
    let!(:post2) { Fabricate(:post, :content => 'Content for post 2') }
    
    before { visit posts_path }
    
    subject { page }
    
    it { page.should have_content(post1.title) }
    it { page.should have_content(post2.title) }
    
    it { page.should have_content('Content for post 1') }
    it { page.should have_content('Content for post 2') }
    
    context "with unpublished posts" do
      
      let!(:unpublished) { Fabricate(:post, :published => false) }
      
      it "does not display unpublished posts" do
        visit posts_path
        page.should_not have_content(unpublished.title)
      end
    end
  end
  
  describe "GET /posts/:token" do
    
    let!(:post) { Fabricate(:post) }
    
    before { visit post_path(post.url_friendly_token) }
    
    subject { page }
    
    it { should have_content(post.title) }
    it { should have_content(post.content) }
  end
end