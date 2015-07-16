class Photographer < ActiveRecord::Base
  has_many :photos
  validates :name, presence: true
  unless ActiveRecord::Base.connection.table_exists?(:photographers)
    ActiveRecord::Base.connection.create_table :photographers do |p|
      p.string :name
      p.string :cameratype
      p.string :employer
    end  
  end
  
end