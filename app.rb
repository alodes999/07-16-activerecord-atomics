require "rubygems"
require "bundler/setup"

require "pry"
require "active_record"
require "bcrypt"
require "sinatra"
require "sinatra/reloader"
require "sinatra/cross_origin"

configure :development do
  require 'sqlite3'
  ActiveRecord:Base.establish_connection(adapter: 'sqlite3', database: 'your_database.db')
end

configure :production do  
  require 'pg'
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

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

enable :sessions