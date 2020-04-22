class ChangeArtistNameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :artists, :name, :full_name
  end
end
