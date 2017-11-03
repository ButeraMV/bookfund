require 'rails_helper'

describe 'Ebooks can be viewed' do
  it 'in an index' do
    category = Category.create(name: 'Fantasy')
    author = Author.new(name: 'Author')
    ebook_collection = 25.times do
      ebook = category.ebooks.create!(title: 'Ebook',
                                      description: 'Book about things',
                                      body: 'Body text',
                                      price: 2.00)
    end

    visit ebooks_path

    expect(page).to have_css(".ebook", count: 20)
    expect(page).to have_css(".title", count: 20)
    expect(page).to have_css(".description", count: 20)
  end
end