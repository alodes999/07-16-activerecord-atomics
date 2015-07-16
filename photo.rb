class Photo < ActiveRecord::Base
  has_and_belongs_to_many :albums
  
  unless ActiveRecord::Base.connection.table_exists?(:photos)
    ActiveRecord::Base.connection.create_table :photos do |p|
      p.string :title
      p.integer :photographer_id
    end
  end
  
end
