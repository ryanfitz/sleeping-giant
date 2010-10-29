class DatabasesController < ApplicationController  
  respond_to :json
  
  def index
    respond_with(server.database_names)
  end

  def show
    respond_with(server[params[:db]].collection_names)
  end
  
end
