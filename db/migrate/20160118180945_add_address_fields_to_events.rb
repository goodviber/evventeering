class AddAddressFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :venue_id, :integer
    add_column :events, :venue_name, :string
    add_column :events, :venue_address1, :string
    add_column :events, :venue_address2, :string
    add_column :events, :venue_town, :string
    add_column :events, :venue_country, :string
    add_column :events, :venue_postcode, :string
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
