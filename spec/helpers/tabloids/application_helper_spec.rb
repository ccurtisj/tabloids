require "spec_helper"

module Tabloids
  
  describe ApplicationHelper do
    
    describe "#tag_list" do
      
      before { Fabricate(:post, :tag_list => 'apple, banana') }
      
      subject { all_post_tags }
      
      it { should have(2).tags }
      it { should include('apple') }
      it { should include('banana') }
    end
  end
end