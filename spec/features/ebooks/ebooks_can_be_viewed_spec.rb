require 'rails_helper'

describe 'Ebooks can be viewed' do
  it 'in an index' do
    ebook_collection = 25.times do
      Ebook.create(title: 'Ebook',
                   description: 'Book about things',
                   body: 'Body text',
                   published: false)
    end

    visit ebooks_path

    expect(page).to have_css(".ebook", count: 20)
    expect(page).to have_css(".title", count: 20)
    expect(page).to have_css(".description", count: 20)
  end
end