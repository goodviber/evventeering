desc "Import Event info from API endpoint"
  task :import_events => :environment do
    require 'HTTParty'

    #put these in secret config file, load through initializer
    auth = {:username => "evvntchallenge", :password => "58ee5bc20f9b2fd0f429c57376e98107"}
    events = HTTParty.get('https://api.sandbox.evvnt.com/events', :basic_auth => auth)

    events.each do |line|
      e = Event.new
      e.uri_id = line['id']
      e.title = line['title']
      e.start_time = line['start_time']
      e.end_time = line['end_time']
      e.keywords = line['keywords']
      e.venue_id = line['venue']['id']
      e.venue_name = line['venue']['name']
      e.venue_address1 = line['venue']['address_1']
      e.venue_address2 = line['venue']['address_2']
      e.venue_town = line['venue']['town']
      e.venue_country = line['venue']['country']
      e.venue_postcode = line['venue']['postcode']
      e.image_url = line['image_url']

      if e.valid?
        puts "adding new event: #{line['title']}"
        e.save
      else
        puts "Event already present:#{line['title']} "
      end
    end


  end
