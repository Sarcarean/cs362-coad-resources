require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

  context 'as an admin' do
 	let(:admin) {create(:user, :admin) }

    it 'can create a region' do
      log_in_as(admin)
	  visit regions_path  
	  click_link 'Add Region'
	  fill_in 'region_name', with: 'Westside'
	  click_button 'Add Region'
	  expect(page).to have_content('Region successfully created.')   
	end

  end
  
end
