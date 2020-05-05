require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let(:ticket) { Ticket.new }
	let(:organization) { build(:organization) }

	let(:open_ticket) { create(:ticket, :open) }	
	let(:closed_ticket) { create(:ticket, :closed) }	
	
	describe 'properties' do
	  it { is_expected.to respond_to(:name) }
	  it { is_expected.to respond_to(:description) }
	  it { is_expected.to respond_to(:phone) }
	  it { is_expected.to respond_to(:closed) }
	  it { is_expected.to respond_to(:closed_at) }
	end
	
	describe 'relationships' do
	  it { is_expected.to belong_to(:resource_category) }
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
	  describe 'open and closed' do
	    it 'includes open tickets but not closed tickets' do     
		  open_tickets = Ticket.open	  
		  expect(open_tickets).to include(open_ticket)
		  expect(open_tickets).not_to include(closed_ticket)
	    end
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
