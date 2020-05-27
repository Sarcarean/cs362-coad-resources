require 'rails_helper'

#https://devhints.io/capybara

RSpec.describe 'Creating an Organization Application', type: :feature do

  let(:user) { create(:user) }
  
  before :each do
    user.confirm
	log_in_as(user)
  end
	
  it 'fill in application form' do 
    create(:user, :admin)	#Create admin so SMTP will work
	visit new_organization_application_path 
	choose 'organization_liability_insurance_true'
	choose 'organization_agreement_one_true'
	choose 'organization_agreement_two_true'
	choose 'organization_agreement_three_true'
	choose 'organization_agreement_four_true'
	choose 'organization_agreement_five_true'
	choose 'organization_agreement_six_true'
	choose 'organization_agreement_seven_true'
	choose 'organization_agreement_eight_true'
	fill_in 'organization_primary_name', with: 'fake'
	fill_in 'organization_name', with: 'fake'
	fill_in 'organization_title', with: 'fake'
	fill_in 'organization_phone', with: '+41 44 111 22 33'
	fill_in 'organization_secondary_name', with: 'fake'
	fill_in 'organization_secondary_phone', with: '+41 44 111 22 32'
	fill_in 'organization_email', with: 'fake@email.com'
	fill_in 'organization_description', with: 'test application'
	click_on "Apply"
	expect(page).to have_content("Application Submitted")
  end
	
end
