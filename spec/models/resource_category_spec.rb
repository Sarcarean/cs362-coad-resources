require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	let(:resource_categories) { create(:resource_category) }
	let(:active_resource_categories) { create(:resource_category, active: true) }
	let(:inactive_resource_categories) { create(:resource_category, active: false) }
	
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

		describe "scopes" do
			describe ".active" do
				it "includes active resource categories" do
					active_resources = ResourceCategory.active
					expect(active_resources).to include(active_resource_categories)
				end
				it "excludes inactive resource categories" do
					active_resources = ResourceCategory.active
					expect(active_resources).not_to include(inactive_resource_categories)
				end	
			end
			describe ".inactive" do 
				it "includes inactive resource categories" do
					inactive_resources = ResourceCategory.inactive
					expect(inactive_resources).to include(inactive_resource_categories)
				end	
				it "excludes active resource categories" do
					inactive_resources = ResourceCategory.inactive
					expect(inactive_resources).not_to include(active_resource_categories)
				end
			end
		end

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
				expected_result = resource_categories.name
				expect(resource_categories.to_s).to eq(expected_result)
			end
		end

		describe "activate" do
			it "remains active if already active" do
				active_resource_categories.activate
				expect(active_resource_categories.inactive?).to be false
			end
			it "changes from inactive to active" do
				inactive_resource_categories.activate
				expect(inactive_resource_categories.inactive?).to be false
			end
		end

		describe "deactivate" do
			it "remains inactive if already inactive" do
				inactive_resource_categories.deactivate
				expect(inactive_resource_categories.inactive?).to be true
			end
			it "changes from active to inactive" do
				active_resource_categories.deactivate
				expect(active_resource_categories.inactive?).to be true
			end
		end

end
