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
    
    context "with tags" do
      before { post1.update_attributes(:tag_list => 'apple, banana') }
      
      it "displays the tag list" do
        visit posts_path
        page.should have_content 'apple'
        page.should have_content 'banana'
      end
    end
    
    context "with categories" do
      let!(:category) { Fabricate(:category) }
      
      it "displays the category list" do
        visit posts_path
        page.should have_content category.name
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
  
  describe "GET /categories/:category_guid" do
    
    let!(:category) { Fabricate(:category) }
    let!(:post_in_category) { Fabricate(:post, :category => category) }
    let!(:other_post) { Fabricate(:post) }
    
    before { visit category_path(category.guid) }
    
    subject { page }
    
    it { should have_content(post_in_category.title) }
    it { should_not have_content other_post.title }
  end
end