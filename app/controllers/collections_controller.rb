class CollectionsController < ApplicationController
  respond_to :json

  def index
    params[:limit]  ||= 20
    params[:skip] ||= 0

    cursor = database[params[:collection]].find({}, :limit => params[:limit].to_i, :skip => params[:skip].to_i)

    respond_with({:docs => cursor.to_a, :limit => cursor.limit, :skip => cursor.skip, :total => cursor.count}.to_json)
  end

  def show
    BSON::ObjectId(params[:id])
    
  end
end