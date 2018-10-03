class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :name
      t.text :biography
      t.integer :age
      t.integer :number_of_movies

      t.timestamps
    end
  end
end
