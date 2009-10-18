require 'spec/spec_helper'

describe ApplicationHelper do
  describe '#link_to_user' do
    before :each do
      @user = User.make
    end
    
    it "should use the user's name as the link text" do
      helper.should_receive(:link_to) do |text, url, options|
        text.should == @user.name
      end
      
      helper.link_to_user(@user)
    end
    
    it "should link to the user's page" do
      helper.should_receive(:link_to) do |text, url, options|
        url.should == @user
      end
      
      helper.link_to_user(@user)
    end
  end
end
