require "rails_helper"

feature "user adds a pack of cigarettes" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bank) { FactoryGirl.create(:bank, value: -0.25) }
  let!(:bank2) { FactoryGirl.create(:bank) }
  let!(:bank3) { FactoryGirl.create(:bank) }

  before(:each) do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    page.find(".submit").click
  end

  scenario "successfully creates a pack of cigarettes" do
    visit new_pack_path
    find("input#pack_price_pack").set("11.52")
    page.find(".submit").click

    expect(page).to have_content("Today")
    expect(page).to have_content("This week")
  end

  scenario "user doesn't enter a price for a pack of cigarettes" do
    visit new_pack_path
    find("pack_price_pack").set("")
    page.find(".submit").click

    expect(page).to have_content("Please enter the price of a pack of cigarettes.")
  end

  scenario "non-user tries to add a pack of cigarettes" do
    click_link "sign out"

    expect(page).to have_content("Log in")
  end
end
