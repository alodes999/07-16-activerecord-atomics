class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  
  unless ActiveRecord::Base.connection.table_exists?(:users)
    ActiveRecord::Base.connection.create_table :users do |p|
      p.string :name
      p.string :password
    end  
  end
  
  # Checks to see if the user has entered the correct password
  #
  # Returns a Boolean.
  def valid_password?(password)
    if !(BCrypt::Password.new(self.password) == password)
      errors.messages["login"] = "Login Failed."
    end
    
    return errors.messages.empty?
  end
  
end