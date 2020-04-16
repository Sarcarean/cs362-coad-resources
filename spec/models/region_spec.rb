require 'rails_helper'

RSpec.describe Region, type: :model do
	
	let(:region) { Region.new }
		
	it "has a name" do
		expect(region).to respond_to(:name) 	
	end
	
end
