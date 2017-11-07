require 'rails_helper'

describe "As a user" do
  it "I can view ebooks that I have posted" do
    user = create(:user)
    author = create(:author)
    ebook = create(:ebook)
    user.authors << author
    author.ebooks << ebook
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_authors_path
    click_on author.name

    expect(page).to have_content(ebook.title)
  end
end