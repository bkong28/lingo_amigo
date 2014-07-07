require 'spec_helper'

feature "Editing answers" do
  let!(:question) { FactoryGirl.create(:question) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:answer) do
    answer = FactoryGirl.create(:answer, question: question)
    answer.update(user: user)
    answer
  end
  
  before do
    sign_in_as!(user)
    visit '/'
    click_link question.phrase
    click_link answer.response
    click_link "Edit Answer"
  end
  
  scenario "Updating a answer" do
    fill_in "Response", with: "Bonjour again"
    click_button "Update Answer"
    
    expect(page).to have_content "Answer has been updated."
    
    within("#answer h2") do
      expect(page).to have_content("Bonjour again")
    end
    
    expect(page).to_not have_content answer.response
  end
  
  scenario "Updating an answer with invalid information" do
    fill_in "Response", with: ""
    click_button "Update Answer"
    
    expect(page).to have_content("Answer has not been updated.")
  end
end