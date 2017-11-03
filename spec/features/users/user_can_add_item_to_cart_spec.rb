require 'rails_helper'

describe "A user" do
  it "can add items to their cart" do
    ebook = Ebook.create(title: 'Ebook',
                description: 'Book about things',
                body: 'Body text',
                price: 2.00)

    visit ebooks_path

    click_on "Add to Cart"
    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_css('.cart-item')
    expect(page).to have_content(ebook.title)
    expect(page).to have_content(2.00)
  end
end