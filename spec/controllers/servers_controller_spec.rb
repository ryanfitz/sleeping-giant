require 'spec_helper'

describe ServersController do

  def mock_server(stubs={})
    (@mock_server ||= mock_model(Server).as_null_object).tap do |server|
      server.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all servers as @servers" do
      Server.stub(:all) { [mock_server] }
      get :index
      assigns(:servers).should eq([mock_server])
    end
  end

  describe "GET show" do
    it "assigns the requested server as @server" do
      Server.stub(:find).with("37") { mock_server }
      get :show, :id => "37"
      assigns(:server).should be(mock_server)
    end
  end

  describe "GET new" do
    it "assigns a new server as @server" do
      Server.stub(:new) { mock_server }
      get :new
      assigns(:server).should be(mock_server)
    end
  end

  describe "GET edit" do
    it "assigns the requested server as @server" do
      Server.stub(:find).with("37") { mock_server }
      get :edit, :id => "37"
      assigns(:server).should be(mock_server)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created server as @server" do
        Server.stub(:new).with({'these' => 'params'}) { mock_server(:save => true) }
        post :create, :server => {'these' => 'params'}
        assigns(:server).should be(mock_server)
      end

      it "redirects to the created server" do
        Server.stub(:new) { mock_server(:save => true) }
        post :create, :server => {}
        response.should redirect_to(server_url(mock_server))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved server as @server" do
        Server.stub(:new).with({'these' => 'params'}) { mock_server(:save => false) }
        post :create, :server => {'these' => 'params'}
        assigns(:server).should be(mock_server)
      end

      it "re-renders the 'new' template" do
        Server.stub(:new) { mock_server(:save => false) }
        post :create, :server => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested server" do
        Server.should_receive(:find).with("37") { mock_server }
        mock_server.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :server => {'these' => 'params'}
      end

      it "assigns the requested server as @server" do
        Server.stub(:find) { mock_server(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:server).should be(mock_server)
      end

      it "redirects to the server" do
        Server.stub(:find) { mock_server(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(server_url(mock_server))
      end
    end

    describe "with invalid params" do
      it "assigns the server as @server" do
        Server.stub(:find) { mock_server(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:server).should be(mock_server)
      end

      it "re-renders the 'edit' template" do
        Server.stub(:find) { mock_server(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested server" do
      Server.should_receive(:find).with("37") { mock_server }
      mock_server.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the servers list" do
      Server.stub(:find) { mock_server }
      delete :destroy, :id => "1"
      response.should redirect_to(servers_url)
    end
  end

end
