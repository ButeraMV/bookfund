FactoryBot.define do
  factory :order do
    user_id { rand(1..75)}
    total_price 2.00
    status { rand(0..3) }
  end
end