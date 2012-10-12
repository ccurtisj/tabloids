require "spec_helper"

module Tabloids
  
  describe Post do
    
    describe "publishing a post" do
      
      let(:post) { Fabricate(:post) }
      
      it "sets published_at to the current time" do
        post.update_attribute(:published, true)
        post.published_at.should be_within(1).of(post.updated_at)
      end
    end
  end
end