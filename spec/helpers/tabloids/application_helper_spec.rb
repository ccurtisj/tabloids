require "spec_helper"

module Tabloids
  
  describe ApplicationHelper do
    
    before { Fabricate(:post, :tag_list => 'apple, banana') }
    
    describe "#all_post_tags" do
      subject { all_post_tags }
      
      it { should have(2).tags }
      it { should include('apple') }
      it { should include('banana') }
    end
    
    describe "#all_post_tags_json" do
      subject { all_post_tags_json }
      it { should eq all_post_tags.to_json }
    end
    
    describe "header_for_posts_index" do
      
      context "given a category" do
        let(:category) { Fabricate(:category) }
        it "returns the name of the tag" do
          header_for_posts_index(:category => category).should eq category.name
        end
      end
      
      context "given a tag" do
        let(:tag) { 'foo' }
        it "returns the name of the tag" do
          header_for_posts_index(:tag => tag).should eq 'Foo'
        end
      end
      
      context "given neither" do
        it "returns 'All Posts'" do
          header_for_posts_index.should eq 'All Posts'
        end
      end
    end
  end
end