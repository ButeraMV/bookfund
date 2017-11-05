require 'rails_helper'

describe 'A user' do
  it 'can view their past orders' do
    user = create(:user)
    ebook = create(:ebook)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit ebooks_path

    click_on "Add to Cart"

    expect(page).to have_content "#{ebook.title} added to cart"

    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(ebook.title)

    click_button "Checkout"

    within(".dropdown-menu") do
      click_on "Past Orders"
    end

    expect(page).to have_content("#{user.orders.first.id}")
  end
end

describe 'As a guest' do
  it 'I cannot view past orders' do
    expect{ visit '/orders' }.to raise_error(ActionController::RoutingError)
  end
end
