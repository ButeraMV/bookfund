require 'rails_helper'

describe "User can checkout" do
  it "from the cart path" do
    create(:category, name: 'Drama')
    create(:category, name: 'Fantasy')
    create(:category, name: 'Action')
    create(:category, name: 'Adventure')

    visit categories_path

    expect(page).to have_css('.category', count: 4)
  end
end
