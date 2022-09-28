class AddDescriptionToSpices < ActiveRecord::Migration[6.1]
  def change
    add_column :spices, :description, :string
    add_column :spices, :image, :string
  end
end
