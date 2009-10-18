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
  
  describe '#to_param' do
    it "should return the user's name" do
      user = User.make
      user.to_param.should == user.name
    end
  end
  
  describe '#to_json' do
    before :each do
      @user = User.make
      @json = JSON.parse @user.to_json
    end
    
    it "should include the user name" do
      @json['user']['name'].should == @user.name
    end
    
    it "should include the beers owing count" do
      @json['user']['beers_owing'].should == 0
    end
    
    it "should include the beers owed count" do
      @json['user']['beers_owed'].should == 0
    end
  end
end
