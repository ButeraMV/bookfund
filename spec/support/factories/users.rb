FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    password 'password'
    first_name 'Firstname'
    last_name 'Lastname'
    street_address '123 Some Street'
    city 'Denver'
    zip_code '80201'
    role 0
  end
end