require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  
  context 'as an admin' do
 	let(:admin) {create(:user, :admin) }

    it 'can delete a region' do
      region = create(:region, name: 'FAKEREGION')  
	  log_in_as(admin)
	  visit regions_path    
	  click_link 'FAKEREGION'
	  click_link 'Delete'
	  expect(page).to have_content('Region FAKEREGION was deleted')   
	end

  end  
  
end
