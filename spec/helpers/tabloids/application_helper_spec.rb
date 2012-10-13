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
  end
end