class Album < ActiveRecord::Base
  has_and_belongs_to_many :photos
  validates :title, presence: true, uniqueness: true
  unless ActiveRecord::Base.connection.table_exists?(:albums)
    ActiveRecord::Base.connection.create_table :albums do |p|
      p.string :title
    end
  end
  
end