require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

  #let(:organization) { create(:organization) }
  #let(:admin_user) { create(:user, :admin) }
  
  context 'as admin' do 
    it 'updating an org successfully' do
	
	  #admin_user.confirm
	  #log_in_as(admin_user)
	
	  #visit edit_organization_path(organization)
	  #fill_in(:name).with('New Fake Name')
	  
	  #fill_in 'Name', with: 'New Fake Name'
	  
	  #click 'Save'
	  #expect(page).to have_content("New Fake Name")
	end
  end
  
  context 'as org user' do
    
	let(:user) { create(:user) }
	let(:organization) { create(:organization, :approved) }
	
	before do
	  user.organization = organization
	  user.save
	end
	
	it 'updating an org successfully' do
	  #visit edit_organization_path(organization)
	  #fill_in(:name).with('New Fake Name')
	  #fill_in 'Name', with: 'New Fake Name'
	   
	  #click 'Save'
	  #expect(page).to have_content('New Fake Name')  
	end
	
  end

end
