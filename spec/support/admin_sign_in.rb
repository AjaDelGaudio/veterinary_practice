module AdminSignIn
  def admin_sign_in
    admin = FactoryGirl.create(:admin)

    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
  end
end
