require "rails_helper"

feature "user adds a pack of cigarettes" do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "successfully creates a pack of cigarettes" do
    visit new_pack_path
    fill_in "Price per pack locally:", with: "11.52"
    click_button "Enter"

    expect(page).to have_content("Pack updated!")
  end

  scenario "non-user tries to add a pack of cigarettes" do
    click_link "Sign out"

    expect(page).to have_content("Log in")
  end
end
