FactoryBot.define do
  factory :ebook do
    sequence(:title) { |n| "eBook #{n}" }
    description "Description about eBook"
    body "Body text"
    price 2.00
    published false
    sequence(:author) { |n| create(:author, name: "Author #{n}") }
  end
end
