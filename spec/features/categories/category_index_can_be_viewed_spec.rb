require 'rails_helper'

describe "Category web pages" do
  it "index can be viewed" do
    create(:category, name: 'Drama')
    create(:category, name: 'Fantasy')
    create(:category, name: 'Action')
    create(:category, name: 'Adventure')

    visit categories_path

    expect(page).to have_css('.category', count: 4)
  end

  it "show page can be viewed" do
    category = create(:category, name: 'Fantasy')
    5.times do
      ebook = create(:ebook)
      category.ebooks << ebook
    end

    visit categories_path
    click_on 'Fantasy'

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_css('.category-ebook', count: 5)
  end
end
