require 'rails_helper'

describe "User can checkout" do
  it "from the cart path" do
    user = create(:user)
    ebook = create(:ebook)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit ebooks_path

    click_on "Add to Cart"
    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(ebook.title)

    click_button "Checkout"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(ebook.title)

    click_on "Cart"

    expect(page).to_not have_content(ebook.title)
  end

  # scenario "visitor cannot checkout" do
  #
  #
  #   visit items_path
  #
  #   within(".item-#{item_1.id}") do
  #     find(:css, ".add-to-cart").click
  #   end
  #
  #   within(".item-#{item_2.id}") do
  #     find(:css, ".add-to-cart").click
  #   end
  #
  #   find(:css, ".cart").click
  #
  #   expect(page).to have_content("Login or Register to checkout")
  #   expect(page).to_not have_content("Checkout")
  # end
end
