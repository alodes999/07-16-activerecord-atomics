class Photographer < ActiveRecord::Base
  has_many :photos
  unless ActiveRecord::Base.connection.table_exists?(:photographers)
    ActiveRecord::Base.connection.create_table :photographers do |p|
      p.string :name
      p.string :cameratype
      p.string :employer
    end  
  end
  
end