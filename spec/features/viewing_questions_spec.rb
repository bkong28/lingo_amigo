require 'spec_helper'

feature "Viewing questions" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }

  before do
  	sign_in_as!(user)
  	define_permission!(user, :view, question)
  end

  scenario "Listing all questions" do
    # question = FactoryGirl.create(:question, phrase: "Fuck you")
    visit '/'
    click_link question.phrase
    
    expect(page.current_url).to eql(question_url(question))
	end
end