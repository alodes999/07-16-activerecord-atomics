require "pry"
require "active_record"
require "sqlite3"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'your_database.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/task.rb"

binding.pry

unless ActiveRecord::Base.connection.table_exists?(:photographers)
  ActiveRecord::Base.connection.create_table :photographers do |p|
    p.string :name
    p.string :cameratype
    p.string :employer
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:photos)
  ActiveRecord::Base.connection.create_table :photos do |p|
    p.string :title
    p.integer :photographer_id
  end  
end

