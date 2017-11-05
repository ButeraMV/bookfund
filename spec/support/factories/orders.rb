FactoryBot.define do
  factory :order do
    user
    total_price 2.00
    status 0
  end
end