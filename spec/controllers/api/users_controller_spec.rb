require 'spec/spec_helper'

describe Api::UsersController do
  describe '#show' do
    it "should return the requested user's json" do
      user = User.make
      get :show, :id => user.name
      
      response.body.should == user.to_json
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
