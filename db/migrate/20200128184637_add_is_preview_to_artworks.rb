class AddIsPreviewToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :is_preview, :boolean
  end
end
