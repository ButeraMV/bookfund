require 'rails_helper'

describe 'A visitor' do
  it 'can create an account' do
    visit '/'
    click_on 'Create Account'
    fill_in 'user[email]', with: 'user@user.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    fill_in 'user[first_name]', with: 'First'
    fill_in 'user[last_name]', with: 'Last'
    fill_in 'user[street_address]', with: '123 Some Street'
    fill_in 'user[city]', with: 'Denver'
    fill_in 'user[zip_code]', with: '80201'
    click_on 'Submit'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Welcome back, First')
  end
end