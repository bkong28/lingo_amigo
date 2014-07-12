require 'spec_helper'

feature 'Creating Questions' do
  before do
    sign_in_as!(FactoryGirl.create(:user))
    visit '/'
    Language.create name:"Spanish"
    
    click_link 'New Question'
  end

  scenario "can create a question" do
    fill_in "How do you say", with: 'Fuck you'
    select "Spanish", from: "Language"
    click_button 'Create Question'
    
    expect(page).to have_content('Question has been created.')
  	
  	question = Question.where(phrase: "Fuck you").first
		
		expect(page.current_url).to eql(question_url(question))
		
		title = "Fuck you - Questions - LingoAmigo"
		expect(page).to have_title(title)
    expect(page).to have_content("How do you say \"Fuck you\" in Spanish?")
	end

  scenario "can not create a question without a phrase" do
    select "Spanish", from: "Language"
    click_button 'Create Question'

    expect(page).to have_content("Question has not been created.")
    expect(page).to have_content("Phrase can't be blank")
  end

  scenario "can not create a question without a language" do
    fill_in "How do you say", with: 'Fuck you'
    click_button 'Create Question'

    expect(page).to have_content("Question has not been created.")
    expect(page).to have_content("Language can't be blank")
  end

end