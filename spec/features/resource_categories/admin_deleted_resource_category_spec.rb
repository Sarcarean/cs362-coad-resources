require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do

  context 'as an admin' do
 	let(:admin) {create(:user, :admin) }

    it 'can delete a resource category' do 
	  resource = create(:resource_category, active: true, name: 'FAKERESOURCE')  
	  log_in_as(admin)
	  visit resource_category_path(resource)  
	  click_link 'Delete'
	  expect(page).to have_content('Category FAKERESOURCE was deleted.')  
	end

  end

end
