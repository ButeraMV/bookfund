FactoryBot.define do
  factory :user do
    email "email@email.com"
    password "password"
    first_name "John"
    last_name  "Doe"
    street_address "123 Some Place"
    city "Denver"
    zip_code "80201"
  end
end