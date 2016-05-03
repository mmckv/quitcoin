require "rails_helper"

feature "user creates an account" do
  let!(:bank) { FactoryGirl.create(:bank, value: -0.25) }
  let!(:bank2) { FactoryGirl.create(:bank) }
  let!(:bank3) { FactoryGirl.create(:bank) }

  scenario "successfully creates an account" do
    visit new_user_registration_path
    fill_in "Email", with: "fakeuser@gmail.com"
    save_and_open_page
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    page.find(".submit").click

    expect(page).to have_content("How much do you pay for a pack of cigarettes?")
  end

  scenario "submits form with too short password" do
    visit new_user_registration_path
    fill_in "Email", with: "blankuser@gmail.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    page.find(".submit").click

    expect(page).to have_content("Please register with us.")
  end

  scenario "submits form with non-matching password and password confirmation" do
    visit new_user_registration_path
    fill_in "Email", with: "blankuser@gmail.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "92345678"
    page.find(".submit").click

    expect(page).to have_content("Please register with us.")
  end
end
