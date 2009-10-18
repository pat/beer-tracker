require 'spec/spec_helper'

describe UsersController do
  describe '#show' do
    it "should assign the requested user by name" do
      user = User.make
      get :show, :id => user.name
      
      assigns[:user].should == user
    end
    
    context "user doesn't exist" do
      before :each do
        get :show, :id => 'foo'
      end
      
      it "should not use a layout" do
        response.layout.should be_nil
      end
      
      it "should render the public 404 page" do
        response.should render_template("#{RAILS_ROOT}/public/404.html")
      end
    
      it "should return with a 404 code" do
        response.code.should == '404'
      end
    end
  end
end
