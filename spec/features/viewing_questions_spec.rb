require 'spec_helper'

feature "Viewing questions" do
  scenario "Listing all questions" do
    question = FactoryGirl.create(:question, phrase: "Fuck you")
    visit '/'
    click_link 'Fuck you'
    expect(page.current_url).to eql(question_url(question))
	end
end