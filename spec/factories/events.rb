FactoryGirl.define do
  factory :event do
    title "big event"
    venue_town "Bigtown"
    sequence(:uri_id) { |n| "#{n}"}
  end

  factory :invalid_event do
    uri_id nil
  end
end
