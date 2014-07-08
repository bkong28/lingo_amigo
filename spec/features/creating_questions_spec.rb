require 'spec_helper'

feature 'Creating Questions' do
  before do
    sign_in_as!(FactoryGirl.create(:admin_user))
    visit '/'
# no need for this anymore since seed data introduced
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
	end

  scenario "can not create a question without a phrase" do
    click_button 'Create Question'

    expect(page).to have_content("Question has not been created.")
    expect(page).to have_content("Phrase can't be blank")
  end

end