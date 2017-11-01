require 'rails_helper'

xdescribe 'A user' do
  it 'can login and out of an existing account' do
    user = User.create(email: "email@email.com",
                      password: "password",
                      first_name: "John",
                      last_name: "Doe",
                      street_address: "123 Some Place",
                      city: "Denver",
                      zip_code: "80201")
    role = Role.new(name: "registered_user")
    user.roles << role

    visit '/'
    click_on 'Login'
    fill_in 'user[email]', with: "#{user.email}"
    fill_in 'user[password]', with: "#{user.password}"
    click_on 'Login'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Welcome back, John')
    expect(page).to have_content('Logout')

    click_on 'Logout'

    expect(current_path).to eq('/')
    expect(session[:user_id]).to eq(nil)
  end
end