class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def server
    Server.find params[:id]
  end
end
