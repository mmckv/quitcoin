require "rails_helper"

feature "user logs out of page" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bank) { FactoryGirl.create(:bank, value: -0.25) }
  let!(:bank2) { FactoryGirl.create(:bank) }
  let!(:bank3) { FactoryGirl.create(:bank) }

  scenario "successfully logs out" do

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_link "Sign out"

    expect(page).to have_content("Log in")
  end
end
