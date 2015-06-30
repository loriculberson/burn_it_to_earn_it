class ActiveRecord::Base
  @@shared_connection = retrieve_connection
  def self.connection
    @@shared_connection || retrieve_connection
  end
end