module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/signin'
    fill_in "username", with: user.name
    fill_in "password", with: user.password
    click_button 'Log in'
    expect(page).to have_content("Logged in successfully.")
	end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
end

module AuthHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end
end

RSpec.configure do |c|
  c.include AuthHelpers, type: :controller
end