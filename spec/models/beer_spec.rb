require 'spec/spec_helper'

describe Beer do
  describe '#valid?' do
    it "should be invalid without a 'from' user" do
      beer = Beer.make_unsaved :from => nil
      beer.should have(1).error_on(:from)
    end
  
    it "should be invalid without a 'to' user" do
      beer = Beer.make_unsaved :to => nil
      beer.should have(1).error_on(:to)
    end
    
    it "should not allow a user to thank themselves" do
      user = User.make
      beer = Beer.make_unsaved :from => user, :to => user
      beer.should have(1).error_on(:to)
    end
  end
  
  describe '#from=' do
    it "should set the user if given a user" do
      beer = Beer.new
      beer.from = User.make
      beer.from.should be_a(User)
    end
    
    it "should find a user by name if given a string" do
      beer = Beer.new
      user = User.make
      beer.from = user.name
      beer.from.should == user
    end
    
    it "should create a new user if one doesn't exist with the given name" do
      beer = Beer.new
      beer.from = 'foo'
      beer.from.name.should == 'foo'
    end
  end
  
  describe '#to=' do
    it "should set the user if given a user" do
      beer = Beer.new
      beer.to = User.make
      beer.to.should be_a(User)
    end
    
    it "should find a user by name if given a string" do
      beer = Beer.new
      user = User.make
      beer.to = user.name
      beer.to.should == user
    end
    
    it "should create a new user if one doesn't exist with the given name" do
      beer = Beer.new
      beer.to = 'foo'
      beer.to.name.should == 'foo'
    end
  end
end
