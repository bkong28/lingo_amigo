require 'spec_helper'

feature "Editing Questions" do
	before do
	  sign_in_as!(FactoryGirl.create(:admin_user))
	  FactoryGirl.create(:language, name: "Spanish")
		FactoryGirl.create(:question, phrase: "Question 2", language_id: "1")

		visit "/"
    click_link "'Question 2' in Spanish?"
    click_link "edit"
	end

  scenario "Updating a question" do
    fill_in "How do you say", with: "Question 2 beta"
    click_button "Update Question"
    
    expect(page).to have_content("Question has been updated.")
  end

  scenario "Updating a question with invalid attributes is bad" do
	  fill_in "How do you say", with: ""
	  click_button "Update Question"
	  
	  expect(page).to have_content("Question has not been updated.")
	end
end