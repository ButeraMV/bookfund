require 'rails_helper'

describe 'As a user' do
  it 'I can create an author' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_authors_path
    
    fill_in 'name', with: 'Author Lastname'
    click_on 'Create new author'

    expect(current_path).to eq(users_authors_path)
    expect(page).to have_content('Author Lastname')
  end

  it 'I can create an ebook' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_authors_path
    
    fill_in 'name', with: 'Author Lastname'
    click_on 'Create new author'
    click_on 'Post an eBook'
    fill_in 'title', with: 'eBook Title'
    fill_in 'description', with: 'Description'
    fill_in 'price', with: 1
    fill_in 'body', with: 'Long body goes here'
    click_on 'Submit eBook'

    expect(page).to have_content("eBook Title")
    expect(page).to have_content('Description')
    expect(page).to have_content('$1.00')
    expect(page).to have_content('Update categories')
  end

  it "I can add categories to my ebook" do
    user = create(:user)
    create(:category, name: 'Action')
    create(:category, name: 'Adventure')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_authors_path
    
    fill_in 'name', with: 'Author Lastname'
    click_on 'Create new author'
    click_on 'Post an eBook'
    fill_in 'title', with: 'eBook Title'
    fill_in 'description', with: 'Description'
    fill_in 'price', with: 1
    fill_in 'body', with: 'Long body goes here'
    click_on 'Submit eBook'

    click_on 'Update categories'
    find(:css, ".Action").set(true)
    click_on "Update categories"

    expect(page).to have_content("eBook Title")
    expect(page).to have_content("Action")

    click_on 'Update categories'
    find(:css, ".Adventure").set(true)
    click_on "Update categories"

    expect(page).to have_content("eBook Title")
    expect(page).to have_content("Action")
    expect(page).to have_content("Adventure")
  end
end