require 'spec_helper'

feature 'Deleting answers' do
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer, question: question) }
  
  before do
    visit '/'
    click_link question.phrase
    click_link answer.response
  end

  scenario "Deleting an answer" do
    click_link "Delete Answer"
    expect(page).to have_content("Answer has been deleted.")
    expect(page.current_url).to eq(question_url(question))
  end
end