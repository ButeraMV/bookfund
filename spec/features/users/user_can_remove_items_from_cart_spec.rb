require 'rails_helper'

describe "A user" do
  it "can remove items from their cart" do
    ebook = create(:ebook)

    visit ebooks_path

    click_on "Add to Cart"
    visit cart_path
    click_on "X"

    expect(current_path).to eq(cart_path)
    expect(page).to_not have_css('.cart-item')
  end
end