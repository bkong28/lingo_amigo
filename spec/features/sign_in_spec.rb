require 'spec_helper'

feature "signing in." do
  scenario 'Signing in via form' do
    user = FactoryGirl.create(:user)
    
    visit '/'
    click_link 'Log in'
    fill_in 'username', with: user.name
    fill_in 'password', with: user.password
    click_button "Log in"
    
    expect(page).to have_content("Logged in successfully.")
  end
end