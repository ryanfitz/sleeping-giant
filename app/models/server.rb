require 'mongo_manager'

class Server < ActiveRecord::Base
  include MongoManager
  
end
