require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

  let(:organization) { create(:organization, :approved) }
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create(:user, organization: organization) }
  
  context 'as an admin' do 
    it 'updating successfully' do
	  log_in_as(admin_user)
	  visit edit_organization_path(organization)
	  fill_in 'organization_name', with: 'Tesla Inc.'
	  fill_in 'organization_phone', with: '541-555-7894'
	  fill_in 'organization_email', with: 'contact@tesla.com'
	  fill_in 'organization_description', with: 'Organizions need change'
	  click_button('commit')
	  expect(current_path).to eq(organization_path(organization))
	end
  end
  
  context 'as an organization user' do
	
	it 'updating successfully' do
	  log_in_as(user)
	  visit edit_organization_path(organization)
	  fill_in 'organization_name', with: 'Tesla Inc.'
	  fill_in 'organization_phone', with: '541-555-7894'
	  fill_in 'organization_email', with: 'contact@tesla.com'
	  fill_in 'organization_description', with: 'Organizions need change'
	  click_button('commit')
	  expect(current_path).to eq(organization_path(organization))
	end
	
  end

end