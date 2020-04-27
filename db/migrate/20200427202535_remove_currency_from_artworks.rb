class RemoveCurrencyFromArtworks < ActiveRecord::Migration[6.0]
  def change
    remove_column :artworks, :currency
  end
end
