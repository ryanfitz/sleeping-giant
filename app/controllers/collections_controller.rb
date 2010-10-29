class CollectionsController < ApplicationController
  respond_to :json

  def index
    params[:limit]  ||= 20
    params[:skip] ||= 0

    collections = database[params[:collection]].find({}, :limit => params[:limit].to_i, :skip => params[:skip].to_i)
    
    respond_with({:docs => collections, :limit => collections.limit, :skip => collections.skip, :total => collections.count}.to_json)
  end
end