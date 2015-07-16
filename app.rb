require "pry"
require "active_record"
require "sqlite3"
require "bcrypt"

set :sessions: true

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'your_database.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "photographer.rb"
require_relative "photo.rb"
require_relative "album.rb"
require_relative "user.rb"

binding.pry
