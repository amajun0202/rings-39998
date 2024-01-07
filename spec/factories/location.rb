FactoryBot.define do
  factory :location do
    association :user

    requires {Requires.all.to_a.reject { |cat| cat.id == 1 }.sample }
    meal_enter {MealEnter.all.to_a.reject { |cat| cat.id == 1 }.sample }

    after(:build) do |location|
      location.images.attach(io: File.open('app/assets/images/item-sample1.png'), filename: 'item-sample1.png')
      location.images.attach(io: File.open('app/assets/images/item-sample2.png'), filename: 'item-sample2.png')
    end
    
    title { Faker::Lorem.word }
    estimated_time {"#{Faker::Number.number(digits: 2)}時間"}
    max_cost { Faker::Number.number(digits: 4) }
    min_cost { Faker::Number.number(digits: 3) }
    description { Faker::Lorem.sentence }
    address {Faker::Address.street_address}
    phone_number {Faker::Number.number(digits: 10)}
    nearest_station { Faker::Address.city }
    travel_time { Faker::Number.number(digits: 2) }
    business_hours { Faker::Lorem.word }
    official_url { Faker::Internet.url }
    
  end
end