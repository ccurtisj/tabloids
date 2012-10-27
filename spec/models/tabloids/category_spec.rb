require "spec_helper"

module Tabloids
  describe Category do
    subject { Category.create(:name => 'Category Title') }
    its(:guid) { should eq 'category-title' }
  end
end