FactoryBot.define do 
    factory :user do 
        name {Faker::Name.name}
        sequence(:email) {|n| "tester#{n}@gmail.com"}
        age {22}
        phone_number {"1234567879"}
    end
end