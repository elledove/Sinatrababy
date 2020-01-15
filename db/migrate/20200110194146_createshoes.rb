class Createshoes < ActiveRecord::Migration
  def change
    create_table :shoes do |s|
      s.string :name
      s.text :description
      s.integer :user_id
      s.string :image
    end
  end
end
