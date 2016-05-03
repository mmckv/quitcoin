require "rails_helper"

feature "user logs into account" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bank) { FactoryGirl.create(:bank, value: -0.25) }
  let!(:bank2) { FactoryGirl.create(:bank) }
  let!(:bank3) { FactoryGirl.create(:bank) }

  scenario "successfully logs in" do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    page.find(".submit").click

    expect(page).to have_content("How much do you pay for a pack of cigarettes?")
  end

  scenario "submits blank form" do
    visit user_session_path
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    page.find(".submit").click

    expect(page).to have_content("Please log in.")
  end

  scenario "submits form with incorrect email" do
    visit user_session_path
    fill_in "Email", with: "notthefakeaccount@gmail.com"
    fill_in "Password", with: user.password
    page.find(".submit").click

    expect(page).to have_content("Please log in.")
  end

  scenario "submits form with incorrect password" do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "99999999"
    page.find(".submit").click

    expect(page).to have_content("Please log in.")
  end
end
