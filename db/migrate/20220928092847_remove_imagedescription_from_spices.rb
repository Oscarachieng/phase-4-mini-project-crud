class RemoveImagedescriptionFromSpices < ActiveRecord::Migration[6.1]
  def change
    remove_column :spices, :imagedescription
  end
end
