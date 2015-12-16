require 'rails_helper'

feature "admin adds new pet", %{
  As a practicing doctor at the veterinary practice,
  I want to record information about a customer's pet
  So I can reference it in the future.
} do

  scenario "admin adds new pet" do
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    visit new_pet_path

    fill_in "Name of pet", with: "Freddy"
    select "Dog", from: "Type of pet"
    fill_in "Breed", with: "Alaskan Huskie"
    fill_in "Age", with: 3
    fill_in "Weight", with: 25
    fill_in "Date of last visit", with: "2013-10-10"
    click_button "Submit"

    expect(page).to have_content("Freddy")
    expect(page).to have_content("Dog")
    expect(page).to have_content("Alaskan Huskie")
    expect(page).to have_content(3)
    expect(page).to have_content(25)
    expect(page).to have_content("2013-10-10")
  end

  # scenario "admin fails to add new pet" do
  #   admin = FactoryGirl.create(:admin)
  #
  #   visit new_admin_session_path
  #   fill_in "Email", with: admin.email
  #   fill_in "Password", with: admin.password
  #   click_button "Log in"
  #   visit new_pet_path
  #
  #
  #   # find('#pet_type_of_pet').find("option[value='Bird']")
  #   click_button "Submit"
  #   save_and_open_page
  #
  #   expect(page).not_to have_select("Bird", selected: "Bird")
  #   expect(page).to have_content("Name of pet required")
  #   expect(page).to have_content("Type of pet required")
  #   expect(page).to have_content("Age required")
  #   expect(page).to have_content("Weight required")
  #   expect(page).to have_content("Date of last visit required")
  # end
#
#   scenario "non-admin user fails to visit new pet page" do
#     pet = FactoryGirl.create(:pet)
#     user = FactoryGirl.create(:user)
#     visit new_admin_session_path
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     click_button "Log in"
#     visit new_pet_path
#
#     expect(page).to have_content("You need to sign in or sign up before continuing.")
#     expect(page).not_to have_content(pet.name_of_pet)
#     expect(page).not_to have_content(pet.breed)
#     expect(page).not_to have_content(pet.date_of_last_visit)
#   end
#
#   scenario "unauthenitcated user fails to visit new pet page" do
#     pet = FactoryGirl.create(:pet)
#     visit new_pet_path
#
#     expect(page).to have_content("You need to sign in or sign up before continuing.")
#     expect(page).not_to have_content(pet.name_of_pet)
#     expect(page).not_to have_content(pet.breed)
#     expect(page).not_to have_content(pet.date_of_last_visit)
#   end
end
