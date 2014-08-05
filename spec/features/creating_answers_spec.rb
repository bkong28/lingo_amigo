require 'spec_helper'
feature "Creating Answers" do
  before do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    
    visit '/'
    click_link question.phrase
    click_link "answer"
    message = "You need to log in or sign up before continuing."
    expect(page).to have_content(message)
    
    fill_in "username", with: user.name
    fill_in "password", with: user.password
    click_button "Log in"
    
    click_link question.phrase
    # click_link "answer"
  end

  scenario "Creating an answer" do
    # fill_in "Response", with: "Bonjour"
    click_button "Submit recording"
    
    expect(page).to have_content("Answer has been created.")

    within "#answer #author" do
      expect(page).to have_content("Answered by sample@example.com")
    end
  end
  
  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    
    expect(page).to have_content("Answer has not been created.")
    # expect(page).to have_content("Response can't be blank")
  end
end