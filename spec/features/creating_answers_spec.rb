require 'spec_helper'
feature "Creating Answers" do
  before do
# code that gets replaced on p185
#    FactoryGirl.create(:question, phrase: "Hello") #, :language_id "1")
#    
#    visit '/'
#    click_link "Hello"
#    click_link "answer"
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    
    visit '/'
    click_link question.phrase
    click_link "answer"
    message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(message)
    
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button "Sign in"
    
    click_link question.phrase
    click_link "answer"
  end

  scenario "Creating an answer" do
    fill_in "Response", with: "Bonjour"
    click_button "Create Answer"
    
    expect(page).to have_content("Answer has been created.")

    within "#answer #author" do
      expect(page).to have_content("Answered by sample@example.com")
    end
  end
  
  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    
    expect(page).to have_content("Answer has not been created.")
    expect(page).to have_content("Response can't be blank")
  end
end