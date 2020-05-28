require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do


  context 'as an admin' do
 	let(:admin) {create(:user, :admin) }
	let(:organization) { create(:organization, :approved) }
	  
	before do
      create(:user, organization: organization)
    end	
	
    it 'making a change to an organization' do
      log_in_as(admin)
	  visit organization_path(organization)
	  click_on('Edit Organization', exact: true)
	  expect(current_path).to eq(edit_organization_path(organization))
	  fill_in 'Name', with: 'Fake New Name'
	  click_on 'Update Resource'
	  expect(page).to have_content('Fake New Name')
	end

  end


end