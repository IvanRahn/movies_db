class AddImgToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :img, :string
  end
end
