require "rails_helper"

feature "user logs into account" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "successfully logs in" do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Price per pack locally:")
  end

  scenario "submits blank form" do
    visit user_session_path
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"

    expect(page).to have_content("Invalid email or password.")
  end

  scenario "submits form with incorrect email" do
    visit user_session_path
    fill_in "Email", with: "notthefakeaccount@gmail.com"
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Invalid email or password.")
  end

  scenario "submits form with incorrect password" do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "99999999"
    click_button "Log in"

    expect(page).to have_content("Invalid email or password.")
  end
end
