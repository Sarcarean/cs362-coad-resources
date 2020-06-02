require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  let(:organization) { create(:organization, :approved) }
  let(:user) { create(:user, organization: organization) }
  let(:ticket) { create(:ticket, organization: user.organization) }
  
  context 'organization user' do
  
    it 'can be done from the ticket screen' do
	  log_in_as(user)
	  visit dashboard_path
	  expect(page).to_not have_content(ticket.name)
	  visit ticket_path(ticket.id)
      click_on 'Release'
	  expect(page).to have_content(ticket.name)
    end
  end
  
  
end
