require 'rails_helper'

RSpec.describe EventsController, :type => :controller do

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'SEARCH functions' do
    it "creates an array of all events" do
      event1 = FactoryGirl.create(:event)
      event2 = FactoryGirl.create(:event)
      get :index
      expect(assigns(:events)).to match_array([event1, event2])
    end

    it "creates an array of events containing matched keywords" do
      event1 = FactoryGirl.create(:event, keywords: "hello")
      event2 = FactoryGirl.create(:event, keywords: "world")
      get :index, :keywords => 'hel'
      expect(assigns(:events)).to match_array([event1])
    end

    it "creates an array of events by start date" do
      event1 = FactoryGirl.create(:event, start_time: "2016-02-02")
      event2 = FactoryGirl.create(:event, start_time: "2015-02-02")
      get :index, :start_time => "2016-01-01"
      expect(assigns(:events)).to match_array([event1])
    end

    it "creates an array of events by end date" do
      event1 = FactoryGirl.create(:event, end_time: "2016-02-02")
      event2 = FactoryGirl.create(:event, end_time: "2015-02-02")
      get :index, :end_time => "2016-01-01"
      expect(assigns(:events)).to match_array([event2])
    end

    it "creates an array of events by location params" do
      event1 = FactoryGirl.create(:event, venue_town: "London", venue_country: "GB", venue_postcode: "W1T 1PD")
      event2 = FactoryGirl.create(:event, venue_town: "Edinburgh", venue_country: "GB", venue_postcode: "EH3 7DX")
      event3 = FactoryGirl.create(:event, venue_town: "Glasgow", venue_country: "GB", venue_postcode: "G4 9XA")
      get :index, :location => "Edinburgh", :distance => 150
      expect(assigns(:events)).to match_array([event2, event3])
    end


  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

end
