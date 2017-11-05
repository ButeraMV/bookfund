require 'rails_helper'

describe 'Ebook show page' do
  it 'can be viewed' do
    ebook = create(:ebook)

    visit '/ebooks'
    click_on "#{ebook.title}"

    expect(page).to have_content(ebook.title)
    expect(page).to have_content(ebook.author.name)
    expect(page).to have_content(ebook.description)
    expect(page).to have_content(ebook.price)
  end
end