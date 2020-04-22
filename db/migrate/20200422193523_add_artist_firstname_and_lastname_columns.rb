class AddArtistFirstnameAndLastnameColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
  end
end
