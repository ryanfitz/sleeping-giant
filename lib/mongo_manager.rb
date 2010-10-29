module MongoManager
  mattr_accessor :connections
  @@connections = {}

  def connection
    if connections[name].nil? or !connections[name].connected?
      connections[name] = Mongo::Connection.new(host, port)
    end

    connections[name]
  end

  def database_names
    connection.database_names
  end

  def [](db_name)
    connection[db_name]
  end
end