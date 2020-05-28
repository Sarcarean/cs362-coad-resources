require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

  context 'as an admin' do
  
    it 'can approve organization' do
	  user = create(:user, :admin)
	  organization = create(:organization)	
	  log_in_as(user)
	  visit dashboard_path(organization_path(organization))
	  
	  
	  
	  #click_on 'Approve'
	  
	  
	  #expect(page).to have_content('was approved')	
	end
	
	
	
	
  end



end
