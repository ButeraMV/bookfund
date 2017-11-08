require 'rails_helper'

describe 'As a user' do
  it 'I can view an ebook that I purchased' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    ebook = create(:ebook)
    user.ebooks << ebook

    visit dashboard_path

    click_on "#{ebook.title}"

    expect(current_path).to eq("/users/ebooks/#{ebook.id}")
  end
end