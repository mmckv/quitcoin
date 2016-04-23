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

  scenario "submits form with too short password" do
    visit new_user_registration_path
    fill_in "Email", with: "blankuser@gmail.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_button "Sign up"

    expect(page).to have_content("Password is too short (minimum is 8 characters)")
  end

  scenario "submits form with non-matching password and password confirmation" do
    visit new_user_registration_path
    fill_in "Email", with: "blankuser@gmail.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "92345678"
    click_button "Sign up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
