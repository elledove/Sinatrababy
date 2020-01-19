class Shoe < ActiveRecord::Base
    validates_presence_of :name, :description
    belongs_to :user #many shoes belong to an User(owner).
end