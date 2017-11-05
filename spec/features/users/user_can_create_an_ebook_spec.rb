require 'rails_helper'

describe 'As a user' do
  it 'I can create an author' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    click_on 'Go to author dashboard'
    fill_in 'name', with: 'Author Lastname'
    click_on 'Create new author'

    expect(current_path).to eq(users_authors_path)
    expect(page).to have_content('Author Lastname')
  end

  it 'I can create an ebook' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    click_on 'Go to author dashboard'
    fill_in 'name', with: 'Author Lastname'
    click_on 'Create new author'
    click_on 'Post an eBook'
    fill_in 'title', with: 'eBook Title'
    fill_in 'description', with: 'Description'
    fill_in 'body', with: 'Long body goes here'
    click_on 'Submit eBook'

    expect(current_path).to eq('/ebooks/1')
    expect(page).to have_content("eBook Title")
  end
end