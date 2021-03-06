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
    page.find(".submit").click
    save_and_open_page
    click_link "sign out"

    expect(page).to have_content("Please log in.")
  end
end
