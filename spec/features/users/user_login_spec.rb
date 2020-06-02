require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

  specify 'user needs to confirm email address' do   
	user = build(:user)
	user.email = 'rnduser@fake.com'
	user.password = '12345678'
	user.save	
	visit root_path
	click_link 'Log in'
	fill_in 'user_email', with: user.email
	fill_in 'user_password', with: user.password
	click_button 'Sign in'
	expect(page).to have_content('You have to confirm your email address') 
  end
  
  specify 'valid user can sign-in' do
 	user = build(:user)
	user.email = 'rnduser@fake.com'
	user.password = '12345678'
	user.confirm
	user.save	
	visit root_path
	click_link 'Log in'
	fill_in 'user_email', with: user.email
	fill_in 'user_password', with: user.password
	click_button 'Sign in' 
	expect(page).to have_content('Signed in successfully.') 	
  end

  specify 'invalid user can sign-in' do   
	visit root_path
	click_link 'Log in'
	fill_in 'user_email', with: 'rnduser@fake.com'
	fill_in 'user_password', with: '12345678'	
	click_button 'Sign in'
	expect(page).to have_content('Invalid Email or password.') 
  end

end
