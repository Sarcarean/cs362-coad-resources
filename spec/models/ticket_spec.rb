require 'rails_helper'

RSpec.describe Ticket, type: :model do
		
	#let(:open_ticket) { build(:open_ticket) }	
	#open_ticket = FactoryBot.build(:ticket)	
	
	
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
	  describe 'open' do
	    it 'includes open tickets but not closed tickets' do
	      open_ticket = FactoryBot.build(:ticket)
		  
		  
		#  closed_ticket = Ticket.create(	  
		#    closed: true,
		#	name: 'Closed',
		#	description: 'ok computer',
		#	region: Region.new(name: 'Fake'),
		#	resource_category: ResourceCategory.new(name: 'Fake')
		#  )
		  
		# open_ticket = Ticket.new(	  
		    # closed: false,
			# name: 'Opened',
			# description: 'ok computer',
			# region: Region.new(name: 'Fake'),
			# resource_category: ResourceCategory.new(name: 'Fake'),
			# # organization: Organization.new(email: 'fake@email.com', name: 'FAKE', phone: '555-123-3355', description: 'fake org', liability_insurance: true, primary_name: 'prims', secondary_phone: '555-555-5555', title: 'title', transportation: :yes, status: 0)
		#)
		  	
		#puts open_ticket
		  
		#closed_ticket = build(:ticket)
		#open_ticket = FactoryBot.build(:ticket)
		#open_tickets = Ticket.open
		  
		#expect(open_tickets).to include(open_ticket)
		#expect(open_tickets).not_to include(closed_ticket)
		  
		 
		  
	    end
	  end
	end
	

end
