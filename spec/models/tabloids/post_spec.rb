require "spec_helper"

module Tabloids
  
  describe Post do
    
    describe "#for_token" do
      
      context "given matching token" do
        it "returns nil" do
          Post.for_token('').should be_nil
        end
      end
      
      context "given a matching token" do
        
        let!(:post) { Fabricate(:post, :url_friendly_token => 'post-token') }
        
        it "returns the post" do
          Post.for_token('post-token').should eq post
        end
      end
    end
    
    describe "publishing a post" do
      
      let(:post) { Fabricate(:post, :title => 'here is my title') }
      before { post.update_attribute(:published, true) }
      
      it "sets published_at to the current time" do
        post.published_at.should be_within(1).of(post.updated_at)
      end
      
      it "sets the url-friendly name" do
        post.url_friendly_token.should eq 'here-is-my-title'
      end
      
      describe "updating the title" do
        
        before { post.update_attributes(:title => 'there is my title') }
        
        it "does not update the url-friendly url" do
          post.url_friendly_token.should eq 'here-is-my-title'
        end
      end
    end

    describe "generating the url-friendly-token" do

      context "given slashes in the title" do
        subject { Fabricate(:post, :title => "here is my //\\ title").url_friendly_token }
        it { should eq "here-is-my-title" }
      end

      context "given quotes in the title" do
        subject { Fabricate(:post, :title => "here is 'my' \"title\"").url_friendly_token }
        it { should eq "here-is-my-title" }
      end
    end
  end
end