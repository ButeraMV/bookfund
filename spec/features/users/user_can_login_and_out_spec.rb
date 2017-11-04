require 'rails_helper'

describe 'A user' do
  it 'can login and out of an existing account' do
    user = User.create(email: "email@email.com",
                      password: "password",
                      first_name: "John",
                      last_name: "Doe",
                      street_address: "123 Some Place",
                      city: "Denver",
                      zip_code: "80201",
                      role: 0)

    visit '/'
    click_on 'Login', match: :first
    fill_in 'user[email]', with: "#{user.email}"
    fill_in 'user[password]', with: "#{user.password}"
    click_on 'Login to my account'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Welcome back, John')
    expect(page).to have_content('Logout')

    click_on 'Logout'

    expect(current_path).to eq('/')
    expect(page).to have_content("Login")
		expect(page).to_not have_content("Logout")
  end
end