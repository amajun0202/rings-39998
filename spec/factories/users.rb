FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'a000000'}
    password_confirmation {password}
    introduce            {'よろしくお願いします'}
  end
end
