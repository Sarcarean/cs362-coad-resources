require 'rails_helper'

RSpec.describe TicketService do

  context 'release a ticket' do
  	
    specify 'by an organization user' do
	  user = create(:user, role: 'organization')
	  user.organization = create(:organization, :approved)
	  myticket = create(:ticket, :open)
	  myticket.organization_id = user.organization_id
	  myticket.save
	  expect(TicketService.release_ticket(myticket.id, user)).to eq(:ok)
    end
	
    specify 'by a user without permission' do
      user = create(:user)
	  myticket = create(:ticket, :open)
	  myticket.save
	  expect(TicketService.release_ticket(myticket.id, user)).to eq('User does not have permission to release ticket')
    end	
	
    specify 'by a admin without permission' do
      user = create(:user, :admin)
	  myticket = create(:ticket, :open)
	  myticket.save
	  expect(TicketService.release_ticket(myticket.id, user)).to eq(:ok)
    end	
	
  end

  context 'capture a ticket' do
      
	specify 'by an organization user' do  
	  user = create(:user, role: 'organization')
	  user.organization = create(:organization, :approved)  
	  myticket = create(:ticket, :open)
	  myticket.save
	  expect(TicketService.capture_ticket(myticket.id, user)).to eq(:ok)
	end
	
    specify 'by a user without an organization' do
      user = create(:user)
	  myticket = create(:ticket, :open)
	  myticket.save
	  expect(TicketService.capture_ticket(myticket.id, user)).to eq('User does not have permission to capture ticket')
    end
	
  end

  context 'close a ticket' do
  
    specify 'by an organization user' do
	  user = create(:user, role: 'organization')
	  user.organization = create(:organization, :approved)
	  myticket = create(:ticket, :open)
	  myticket.organization_id = user.organization_id
	  myticket.save
	  expect(TicketService.close_ticket(myticket.id, user)).to eq(:ok)	
	end

    specify 'by a user without permission' do
      user = create(:user)
	  myticket = create(:ticket, :open)
	  myticket.organization_id = 5		#random id
	  myticket.save
	  expect(TicketService.close_ticket(myticket.id, user)).to eq('User does not have permission to close ticket')
    end	
	
    specify 'by a admin without permission' do
      user = create(:user, :admin)
	  myticket = create(:ticket, :open)
	  myticket.save
	  expect(TicketService.close_ticket(myticket.id, user)).to eq(:ok)
    end	

  end

end
