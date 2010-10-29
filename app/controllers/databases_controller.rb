class DatabasesController < ApplicationController  
  respond_to :json
  
  def index
    respond_with(server.database_names)
  end

  def show
    respond_with(database.collection_names)
  end
  
end
