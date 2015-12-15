require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :admin do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :doctor do
    name "Dr. Healthy"
    address "12 Franklin St."
    city  "San Antonio"
    state "TX"
    zip "03021"
    school_recieved_degree_from "University of Austin"
    years_in_practice 12
  end

  factory :pet do
    name_of_pet "Freddy"
    type_of_pet "Bird"
    breed "Malaysian parrot"
    age 88
    weight 4.0
    date_of_last_visit "2014-12-15"
  end
end
