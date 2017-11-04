require 'rails_helper'

describe 'Ebooks can be viewed' do
  it 'in an index' do
    25.times do
      create(:ebook)
    end

    visit ebooks_path

    expect(page).to have_css(".ebook", count: 20)
    expect(page).to have_css(".title", count: 20)
    expect(page).to have_css(".description", count: 20)
  end
end