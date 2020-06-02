require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

  context 'as an admin' do
  
    specify 'can approve organization' do 
	  user = create(:user, :admin)
	  log_in_as(user)  
	  organization = create(:organization, :submitted) 
	  visit organization_path(organization)  	  
	  click_on 'Approve'  	  
	  expect(page).to have_content('has been approved')	
	end	
	
  end

end
