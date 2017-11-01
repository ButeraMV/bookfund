require 'rails_helper'

describe 'A user' do
  it 'can login to an existing account' do
    user = create(:user)

    visit '/'
    click_on 'Login'
    fill_in 'user[email]', with: "#{user.email}"
    fill_in 'user[password]', with: "#{user.password}"
    click_on 'Login'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Welcome back, John')
  end
end