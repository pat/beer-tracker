class UsersController < ApplicationController
  def show
    @user = User.find_by_name params[:id]
    
    if @user.nil?
      render :status => 404, :file => "#{RAILS_ROOT}/public/404.html"
    end
  end
end
