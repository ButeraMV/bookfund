require 'rails_helper'

describe 'Ebooks can be viewed' do
  it 'in an index' do
    10.times do
      create(:ebook)
    end

    visit ebooks_path

    expect(page).to have_css(".ebook-index-item", count: 8)
    expect(page).to have_css(".title", count: 8)
    expect(page).to have_css(".description", count: 8)
  end
end