class Api::BeersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    beer = Beer.new params[:beer]
    
    if beer.save
      render :json => beer
    else
      render :text => 'No Beer for You!', :status => 400
    end
  end
end
