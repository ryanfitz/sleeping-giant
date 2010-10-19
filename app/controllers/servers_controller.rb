class ServersController < ApplicationController
  # GET /servers
  # GET /servers.xml
  respond_to :html, :json
  
  def index
    respond_with(@servers = Server.all)
  end

  def show
    @server = Server.find(params[:id])
    respond_with(@server)
  end

  def new
    @server = Server.new
    respond_with(@server)
  end

  def edit
    @server = Server.find(params[:id])
    respond_with(@server)
  end

  def create
    @server = Server.create(params[:server])
    respond_with(@server)
  end

  def update
    @server = Server.find(params[:id])
    @server.update_attributes(params[:server])
    
    respond_with(@server)
  end

  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to(servers_url) }
      format.json { head :ok }
    end
  end
end
