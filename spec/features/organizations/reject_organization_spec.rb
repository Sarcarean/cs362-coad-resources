require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  
  context 'as an admin' do
 	let(:admin) {create(:user, :admin) }
	let(:organization) { create(:organization, :submitted) }
	  
	before do
      create(:user, organization: organization)
    end	
	
    it 'reject an organization' do
      log_in_as(admin)
	  visit organization_path(organization)  
	  fill_in 'organization_rejection_reason', with: 'Beth is a clone'
	  click_button 'Reject'
	  expect(page).to have_content('Organization ' + organization.name + ' has been rejected.')
	end

  end
  
end
