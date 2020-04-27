class AddCurrencyToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :currency, :string, default: 'EUR'
  end
end
