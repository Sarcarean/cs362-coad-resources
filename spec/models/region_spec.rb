require 'rails_helper'

RSpec.describe Region, type: :model do
	
	let(:region) { Region.new(name: 'FAKE') }
	
	describe "attributes" do
		it "has a name" do
			expect(region).to respond_to(:name)
		end
	end

	describe "relationships" do	
		it "has many tickets" do	
			expect(region).to have_many(:tickets)
		end
	end
end


