require 'spec_helper'

feature "Deleting questions" do
  scenario "Deleting a question" do
    FactoryGirl.create(:question, phrase: "Fuck you")
    
    visit "/"
    click_link "Fuck you"
    click_link "Delete Question"
    
    expect(page).to have_content("Question has been destroyed.")

		visit "/"
    
    expect(page).to have_no_content("Fuck you")
  end
end