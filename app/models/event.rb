class Event < ActiveRecord::Base
  attr_accessible :end_time, :image_url, :keywords, :start_time, :title, :uri_id, :venue_id, :venue_name, :venue_address1, :venue_address2, :venue_town, :venue_country, :venue_postcode, :latitude, :longitude
  validates :uri_id, presence: true, uniqueness: true
  geocoded_by :full_address
  after_validation :geocode


  def full_address
    "#{venue_address1}, #{venue_address2}, #{venue_town}, #{venue_country}, #{venue_postcode}"
  end
end
