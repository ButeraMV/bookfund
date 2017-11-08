require 'rails_helper'

describe "Login with twitter" do
  it "can sign in user with Twitter account" do
    visit login_path
    expect(page).to have_content("Sign in with Twitter")
    mock_auth_hash
    click_link "Sign in"
    expect(current_path).to eq(dashboard_path)
  end
end