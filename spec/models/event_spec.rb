require 'rails_helper'

RSpec.describe Event, :type => :model do
 describe Event do

   it "is invalid without a uri_id" do
     event = Event.new(uri_id: nil)
     expect(event).not_to be_valid
     expect(event.errors[:uri_id]).to include("can't be blank")
     end

   it "is valid with a uri_id" do
     event = Event.new(uri_id: 1)
     expect(event).to be_valid
   end

   it "generates a valid factory instance" do
     expect(FactoryGirl.build(:event)).to be_valid
   end

   it "is invalid with a duplicate uri_id" do
     FactoryGirl.create(:event, uri_id: 10)
     event = FactoryGirl.build(:event, uri_id: 10)
     event.valid?
     expect(event.errors[:uri_id]).to include('has already been taken')
   end

 end
end
