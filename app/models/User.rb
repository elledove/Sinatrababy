class User  < ActiveRecord::Base 
    has_secure_password #method from bcrypt
    validates :username, :password, presence: true  #Macro Validates that the username/password are both present.
    validates_uniqueness_of :username
    has_many :shoes #Users(owners) have many shoes. Macro from ActiveRecord. access to ORM methods
end