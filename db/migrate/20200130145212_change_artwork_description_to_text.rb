class ChangeArtworkDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :artworks, :description, :text
  end
end
