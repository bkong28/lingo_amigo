require 'spec_helper'

feature "Viewing answers" do
  before do

    language = FactoryGirl.create(:language)

    hello = FactoryGirl.create(:question, phrase: "Hello", language: language)
    
    user = FactoryGirl.create(:user)
    answer = FactoryGirl.create(:answer, question: hello, response: "Bonjour")
    answer.update(user: user)
    
    goodbye = FactoryGirl.create(:question, phrase: "Goodbye", language: language)
    
    FactoryGirl.create(:answer, question: goodbye, response: "Au revoir")
  
    visit '/'
    
  end

  scenario "Viewing answers for a given question" do
    click_link "Hello"
    
    expect(page).to have_content("Bonjour")
    expect(page).to_not have_content("Au revoir")
  end
end