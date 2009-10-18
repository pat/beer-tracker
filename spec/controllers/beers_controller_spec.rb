require 'spec/spec_helper'

describe BeersController do
  describe '#index' do
    it "should assign a list of beers" do
      get :index
      
      assigns[:beers].should_not be_nil
    end
  end
end
