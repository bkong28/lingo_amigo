require 'spec_helper'

feature 'Creating Questions' do

  scenario "can create a question" do
    visit '/'

    click_link 'New Question'

    fill_in "How do you say", with: 'Fuck you'
    fill_in "in", with: 'Korean'
    click_button 'Create Question'
    
    expect(page).to have_content('Question has been created.')
  	
  	question = Question.where(phrase: "Fuck you").first
		
		expect(page.current_url).to eql(question_url(question))
		
		title = "Fuck you - Questions - LingoAmigo"
		expect(page).to have_title(title)

	end
end