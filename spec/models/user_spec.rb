require 'spec/spec_helper'

describe User do
  describe '#valid?' do
    it "should be invalid with a name" do
      user = User.make_unsaved(:name => '')
      user.should have(1).error_on(:name)
    end
  
    it "should be invalid with a duplicate name" do
      user = User.make
      user = User.make_unsaved(:name => user.name)
      user.should have(1).error_on(:name)
    end
  end
end
