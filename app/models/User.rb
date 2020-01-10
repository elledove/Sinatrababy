class User  < ActiveRecord::Base #I need to figure out how check this.
    has_many :shoes #Users(owners) have many shoes.
end