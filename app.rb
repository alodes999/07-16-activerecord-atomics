require "pry"
require "active_record"
require "sqlite3"
require "bcrypt"
require "sinatra"
require "sinatra/reloader"
require "sinatra/cross_origin"

# set :sessions => true

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'your_database.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/photographer.rb"
require_relative "models/photo.rb"
require_relative "models/album.rb"
require_relative "models/user.rb"

# Controllers
require_relative "controllers/album_controller"
require_relative "controllers/home_controller"
require_relative "controllers/photo_controller"
require_relative "controllers/photographer_controller"
require_relative "controllers/albumphoto_controller"