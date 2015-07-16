class User < ActiveRecord::Base
  
  unless ActiveRecord::Base.connection.table_exists?(:users)
    ActiveRecord::Base.connection.create_table :users do |p|
      p.string :name
      p.string :password
    end  
  end
  
  
  
end