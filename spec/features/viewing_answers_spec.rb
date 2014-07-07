require 'spec_helper'

feature "Viewing tickets" do
  before do
    hello = FactoryGirl.create(:question,
                                    phrase: "Hello",
                                    language_id: 1)
    
    FactoryGirl.create(:answer,
            question: hello,
            response: "Bonjour")
    
    goodbye = FactoryGirl.create(:question,
                                           phrase: "Goodbye",
                                           language_id: 2)
    
    FactoryGirl.create(:answer,
            question: goodbye,
            response: "Au revoir")
  
    visit '/' 
  end

  scenario "Viewing answers for a given question" do
    click_link "Hello"
    
    expect(page).to have_content("Bonjour")
    expect(page).to_not have_content("Au revoir")
  end
end