require 'spec_helper'

feature 'Creating Questions' do

  scenario "can create a question" do
    visit '/'

    click_link 'New Question'

    fill_in "How do you say", with: 'Fuck you!'
    fill_in "in", with: 'Korean'
    click_button 'Create Question'
    
    expect(page).to have_content('Question has been created.')
  end
end