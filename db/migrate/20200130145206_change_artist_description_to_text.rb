class ChangeArtistDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :artists, :description, :text
  end
end
