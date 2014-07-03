require 'spec_helper'

feature "Editing Questions" do
	before do
    FactoryGirl.create(:question, phrase: "Fuck you")
    
    visit "/"
    click_link "Fuck you"
    click_link "Edit Question"
  end

  scenario "Updating a question" do

    fill_in "How do you say", with: "screw you too"
    click_button "Update Question"
    
    expect(page).to have_content("Question has been updated.")
  end

	scenario "Updating a question with invalid attributes is bad" do
	  fill_in "How do you say", with: ""
	  click_button "Update Question"
	  expect(page).to have_content("Question has not been updated.")
	end
end