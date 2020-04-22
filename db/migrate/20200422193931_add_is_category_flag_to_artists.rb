class AddIsCategoryFlagToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :is_category, :boolean, default: false
  end
end
