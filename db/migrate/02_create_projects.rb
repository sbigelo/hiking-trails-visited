class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.string :date_visited
      t.integer :rating


      t.timestamps null: false
    end
  end
end

