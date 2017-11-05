require 'rails_helper'

describe 'As a user' do
  it 'I can view my dashboard' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Welcome back")
  end
end

describe 'As a guest' do
  it 'I cannot view a dashboard' do
    expect{ visit '/dashboard' }.to raise_error(ActionController::RoutingError)
  end
end
