require 'rails_helper'

RSpec.describe Region, type: :model do
	let(:region) { build(:region) }

	it "has many tickets" do
		expect(region).to have_many(:tickets)
	end
	
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

	describe "validations" do
		it "validates name" do
			expect(region).to validate_presence_of(:name)
		end
		it "validates length of name" do 
			expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end
		it "validates uniqueness of name" do 
			expect(region).to validate_uniqueness_of(:name).case_insensitive
		end
	end

	describe "#to_s" do
		it "has a string representation that is the name" do
			expect(region.to_s).to start_with('fake')
		end
	end
	
	describe "association example" do
	  before do
	   region.tickets << build_stubbed(:ticket)
	  end
	end

	describe "::unspecified" do 
		it "creates a new Unspecified region when one does not exist" do
			expect(Region.where(name: 'Unspecified')).to be_empty
			expect{ Region.unspecified }.to change { Region.count }.by(1)
		end
		it "does not create a new Unspecified region when one already exists" do
		    create(:region, :unspecified_region)
			expect{ Region.unspecified }.to_not change { Region.count}				
		end
		it "returns a region with the name 'Unspecified'" do	
			expect(Region.unspecified.name).to eq('Unspecified')
		end
	end
end


