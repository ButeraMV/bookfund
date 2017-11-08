require 'rails_helper'

describe "A user" do
  it "can add items to their cart" do
    ebook = create(:ebook)

    visit ebooks_path

    click_on "Add to Cart"

    visit cart_path

    expect(current_path).to eq(cart_path)
    expect(page).to have_css('.cart-item')
    expect(page).to have_content(ebook.title)
    expect(page).to have_content(2.00)
  end
end