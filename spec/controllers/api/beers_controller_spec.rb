require 'spec/spec_helper'

describe Api::BeersController do
  describe '#create' do
    context 'json' do
      before :each do
        @beer = Beer.make
        Beer.stub!(:new => @beer)
      end
      
      it "should return the beer object as json on success" do
        @beer.stub!(:save => true)
        post :create, :beer => {}, :format => :json
        
        response.body.should == @beer.to_json
      end
      
      it "should return an error message on failure" do
        @beer.stub!(:save => false)
        post :create, :beer => {}, :format => :json
        
        response.body.should == 'No Beer for You!'
      end
      
      it "should return a 400 code on failure" do
        @beer.stub!(:save => false)
        post :create, :beer => {}, :format => :json
        
        response.code.should == '400'
      end
    end
  end
end
