require 'rails_helper'

feature "admin visits doctors index page", %{
  As the owner of a veterinary practice,
  I want to view a list of all doctors in the database
  So I can track the name, address, school, and years in practice of each doctor
} do

  scenario "admin visits index page" do
    doctor = FactoryGirl.create(:doctor)
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit doctors_path

    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.address)
    expect(page).to have_content(doctor.city)
    expect(page).to have_content(doctor.state)
    expect(page).to have_content(doctor.zip)
    expect(page).to have_content(doctor.school_recieved_degree_from)
    expect(page).to have_content(doctor.years_in_practice)
  end

  scenario "non-admin user visits index page" do
    doctor = FactoryGirl.create(:doctor)
    user = FactoryGirl.create(:user)
    visit new_admin_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit doctors_path

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).not_to have_content(doctor.name)
    expect(page).not_to have_content(doctor.address)
    expect(page).not_to have_content(doctor.years_in_practice)
  end
end
