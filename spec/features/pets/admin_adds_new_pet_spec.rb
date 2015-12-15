require 'rails_helper'

feature "admin adds new pet", %{
  As a practicing doctor at the veterinary practice,
  I want to record information about a customer's pet
  So I can reference it in the future.
} do

  scenario "admin adds new pet" do
    pet = FactoryGirl.create(:pet)
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    visit new_pet_path

    fill_in "Name of pet", with: pet.name_of_pet
    select pet.type_of_pet, from: "Type of pet"
    fill_in "Breed", with: pet.breed
    fill_in "Age", with: pet.age
    fill_in "Weight", with: pet.weight
    fill_in "Date of last visit", with: pet.date_of_last_visit
    click_button "Submit"

    expect(page).to have_content(pet.name_of_pet)
    expect(page).to have_content(pet.type_of_pet)
    expect(page).to have_content(pet.breed)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.weight)
    expect(page).to have_content(pet.date_of_last_visit)
  end

  scenario "admin adds new pet" do
    pet = FactoryGirl.create(:pet)
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    visit new_pet_path

    select pet.type_of_pet, from: "Type of pet"
    click_button "Submit"

    expect(page).not_to have_content(pet.type_of_pet)
    expect(page).to have_content("Name of pet required")
    expect(page).to have_content("Type of pet required")
    expect(page).to have_content("Age required")
    expect(page).to have_content("Weight required")
    expect(page).to have_content("Date of last visit required")
  end

  scenario "non-admin user fails to visit new pet page" do
    pet = FactoryGirl.create(:pet)
    user = FactoryGirl.create(:user)
    visit new_admin_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit new_pet_path

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).not_to have_content(pet.name_of_pet)
    expect(page).not_to have_content(pet.breed)
    expect(page).not_to have_content(pet.date_of_last_visit)
  end

  scenario "unauthenitcated user fails to visit new pet page" do
    pet = FactoryGirl.create(:pet)
    visit new_pet_path

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).not_to have_content(pet.name_of_pet)
    expect(page).not_to have_content(pet.breed)
    expect(page).not_to have_content(pet.date_of_last_visit)
  end
end
