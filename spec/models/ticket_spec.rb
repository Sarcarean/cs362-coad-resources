require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let(:ticket) { Ticket.new }
	let(:organization) { build(:organization) }	
	
	describe 'properties' do
	  it { is_expected.to respond_to(:name) }
	  it { is_expected.to respond_to(:description) }
	  it { is_expected.to respond_to(:phone) }
	  it { is_expected.to respond_to(:closed) }
	  it { is_expected.to respond_to(:closed_at) }
	end
	
	describe 'relationships' do
	  it { is_expected.to belong_to(:region) }
	  it { is_expected.to belong_to(:resource_category) }
	  it { is_expected.to belong_to(:organization) }
	end
	
	describe 'validations' do
	  it { is_expected.to validate_presence_of(:name) }
	  it { is_expected.to validate_presence_of(:phone) }
	  it { is_expected.to validate_presence_of(:region_id) }
	  it { is_expected.to validate_presence_of(:resource_category_id) }
	  it { is_expected.to validate_length_of(:name).is_at_least(1) }
	  it { is_expected.to validate_length_of(:name).is_at_most(255) }
	  it { is_expected.to validate_length_of(:description).is_at_most(1020) }
	end
	
	describe 'scopes' do
		let(:open_ticket) { create(:ticket, :open) }	
		let(:closed_ticket) { create(:ticket, :closed) }
		let(:open_ticket_with_org) { create(:ticket, :open, :with_org) }
		let(:closed_ticket_with_org) { create(:ticket, :closed, :with_org) }

	    it 'returns open tickets but not closed tickets' do     
		  open_tickets = Ticket.open	  
		  expect(open_tickets).to include(open_ticket)
		  expect(open_tickets).not_to include(closed_ticket)
		end
		
		it 'returns closed tickets but not open tickets' do
			closed_tickets = Ticket.closed
			expect(closed_tickets).to include(closed_ticket)
			expect(closed_tickets).not_to include(open_ticket)
		end

		it 'returns open tickets that have an organization' do
			tickets = Ticket.all_organization
			expect(tickets).to include(open_ticket_with_org)
			expect(tickets).not_to include(closed_ticket)
		end

		it 'returns open tickets with that organization id' do
			ticket = Ticket.organization(open_ticket_with_org)
			expect(ticket).to include(open_ticket_with_org)
			expect(ticket).not_to include(closed_ticket_with_org)
		end

		it 'returns closed tickets with that organization id' do
			ticket = Ticket.closed_organization(closed_ticket_with_org)
			expect(ticket).to include(closed_ticket_with_org)
			expect(ticket).not_to include(open_ticket_with_org)
		end
	
	end
	
	describe 'captured' do 
	  it 'ticket is not captured by default' do
	    expect(ticket.captured?).to eq(false)
	  end
	  
	  it 'ticket is captured' do
	    ticket.organization = organization
		expect(ticket.captured?).to eq(true)
	  end  
	end
	

end
