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
end
