class DatabasesController < ApplicationController
  include Mongo
  
  respond_to :json
  
  def index
    server = Server.find params[:id]
    connection = Mongo::Connection.new(server.host, server.port)
    
    respond_with(connection.database_names)
  end

end
