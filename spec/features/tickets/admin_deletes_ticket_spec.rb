require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  let(:organization) { create(:organization, :approved) }
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create(:user, organization: organization) }
  let(:ticket) { create(:ticket, organization: user.organization) }
  
  context 'as an admin user' do 
    it 'can be done from the ticket screen' do
	  log_in_as(admin_user)
	  visit ticket_path(ticket.id)
	  click_on 'Delete'
	  expect(page).to have_content("Ticket " + ticket.id.to_s + " was deleted.")  
    end
  end
  
end
