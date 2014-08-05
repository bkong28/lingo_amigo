require 'spec_helper'

feature 'Signing up' do
  scenario 'Successful sign up' do
		visit '/'
    
    click_link 'Sign up'
    fill_in "email address", with: "user@example.com"
    fill_in "password", with: "password"
    fill_in "retype password", with: "password"
    click_button "Sign up"
    
    expect(page).to have_content("You have signed up successfully.")
  end
end