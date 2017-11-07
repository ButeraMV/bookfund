require 'rails_helper'

describe 'As an admin' do
  it 'I can view the admin dashboard' do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content('Admin Dashboard')
  end
end