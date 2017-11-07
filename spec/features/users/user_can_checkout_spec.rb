require 'rails_helper'

describe "User can checkout" do
  xit "from the cart path" do
    user = create(:user)
    ebook = create(:ebook)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit ebooks_path

    click_on "Add to Cart"

    expect(page).to have_content "#{ebook.title} added to cart"

    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(ebook.title)

    find(:css, ".stripe-button-el").click

    expect(current_path).to eq(thanks)


    click_on "Cart"

    expect(page).to_not have_content(ebook.title)
  end

  xit "visitor cannot checkout" do
    ebook = create(:ebook)

    visit ebooks_path

    click_on "Add to Cart"
    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(ebook.title)
    expect(page).to have_content("Login or Register to checkout")
    expect(page).to_not have_content("Pay with Card")
  end
end
