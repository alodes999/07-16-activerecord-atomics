class Photo < ActiveRecord::Base
  has_and_belongs_to_many :albums
  validates :title, presence: true
  
  unless ActiveRecord::Base.connection.table_exists?(:photos)
    ActiveRecord::Base.connection.create_table :photos do |p|
      p.string :title
      p.integer :photographer_id
    end
  end
  
  def top_photo?
    if self.albums.length >= 3
      true
    else
      false
    end
  end
  
end
