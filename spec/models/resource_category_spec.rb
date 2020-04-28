require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    let(:resource_categories) { ResourceCategory.new(name: 'FAKE') }

    describe "attributes" do
			it "has a name " do 
				expect(resource_categories).to respond_to(:name)
			end
		end

		describe "relationships" do
			it "has many and belongs" do
				expect(resource_categories).to have_and_belong_to_many(:organizations)
			end	
			it "has many tickets" do
				expect(resource_categories).to have_many(:tickets)
			end
		end

		describe "validations" do
			it "validates length of name" do
				expect(resource_categories).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
			end
			it "has a unique name" do
				expect(resource_categories).to validate_uniqueness_of(:name).case_insensitive()
			end
		end

		## TODO TEST SCOPES

		describe "::unspecified" do 
			it "creates a new Unspecified region when one does not exist" do
				expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
				expect{ ResourceCategory.unspecified }.to change { ResourceCategory.count }.by(1)
			end
			it "does not create a new Unspecified region when one already exists" do
				ResourceCategory.create(name: 'Unspecified')
				expect{ ResourceCategory.unspecified }.to_not change { ResourceCategory.count}
			end
			it "returns a region with the name 'Unspecified'" do	
				expect(ResourceCategory.unspecified.name).to eq('Unspecified')
			end
		end

		describe "#to_s" do
			it "has a string representation that is the name" do
				expect(resource_categories.to_s).to eq('FAKE')
			end
		end

		describe "active scope" do
			it "has an active scope" do
			active_resource = ResourceCategory.create(name: 'FAKE', active: true)
			inactive_resource = ResourceCategory.create(name: 'FAKE', active: false)


			expect(active_resource.inactive?).to be false
			expect(inactive_resource.inactive?).to be true
			end
		end

end
