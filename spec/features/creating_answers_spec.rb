require 'spec_helper'
feature "Creating Answers" do
  before do
    FactoryGirl.create(:question, phrase: "Hello")
    
    visit '/'
    click_link "Hello"
    click_link "New Answer"
  end

  scenario "Creating an answer" do
    fill_in "Response", with: "Bonjour"
    click_button "Create Answer"
    
    expect(page).to have_content("Answer has been created.")
  end
  
  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    
    expect(page).to have_content("Answer has not been created.")
    expect(page).to have_content("Response can't be blank")
  end
end