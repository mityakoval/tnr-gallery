class AddCurrencyToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :currency, :string, default: 'EUR'
  end
end
