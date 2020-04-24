require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    let(:resource_categories) { ResourceCategory.new() }

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
end
