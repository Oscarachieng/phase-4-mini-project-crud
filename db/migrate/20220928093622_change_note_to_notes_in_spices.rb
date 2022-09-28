class ChangeNoteToNotesInSpices < ActiveRecord::Migration[6.1]
  def change
    rename_column :spices, :note, :notes
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
