require "rails_helper"

feature "user creates an account" do
  scenario "successfully creates an account" do
    visit new_user_registration_path
    fill_in "Email", with: "fakeuser@gmail.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"

    expect(page).to have_content("Price per pack locally:")
  end
end
