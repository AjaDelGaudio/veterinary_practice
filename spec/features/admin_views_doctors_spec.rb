require "rails-helper"

feature "admin visits doctors index page", %{
  As the owner of a veterinary practice,
  I want to view a list of all doctors in the database
  So I can track the name, address, school, and years in practice of each doctor
} do

  scenario "admin visists index page" do
    admin = FactoryGirl.create(:admin)
    doctor = FactoryGirl.create(:doctor)

    admin_sign_in
    visit doctors_path

    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.address)
    expect(page).to have_content(doctor.city)
    expect(page).to have_content(doctor.state)
    expect(page).to have_content(doctor.zip)
    expect(page).to have_content(doctor.school_recieved_degree_from)
    expect(page).to have_content(doctor.years_in_practice)
  end
end
