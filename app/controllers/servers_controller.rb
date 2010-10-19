class ServersController < ApplicationController
  # GET /servers
  # GET /servers.xml
  respond_to :html, :json
  
  def index
    respond_with(@servers = Server.all)
  end

  # GET /servers/1
  # GET /servers/1.xml
  def show
    @server = Server.find(params[:id])
    respond_with(@server)
  end

  # GET /servers/new
  # GET /servers/new.xml
  def new
    @server = Server.new
    respond_with(@server)
  end

  # GET /servers/1/edit
  def edit
    @server = Server.find(params[:id])
    respond_with(@server)
  end

  # POST /servers
  # POST /servers.xml
  def create
    @server = Server.create(params[:server])
    respond_with(@server)
  end

  # PUT /servers/1
  # PUT /servers/1.xml
  def update
    @server = Server.find(params[:id])
    @server.update_attributes(params[:server])
    
    respond_with(@server)
  end

  # DELETE /servers/1
  # DELETE /servers/1.xml
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to(servers_url) }
      format.xml  { head :ok }
    end
  end
end
