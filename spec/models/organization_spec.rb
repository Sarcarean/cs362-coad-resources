require 'rails_helper'

RSpec.describe Organization, type: :model do

	let(:organization) { FactoryBot.build(:organization, :approved) }
	
	describe 'attribute' do
		it "has an email" do
			expect(organization).to respond_to(:email)
		end
		it "has a name" do
			expect(organization).to respond_to(:name)
		end
		it "has a status" do
			expect(organization).to respond_to(:status)
		end
		it "has a primary name" do
			expect(organization).to respond_to(:primary_name)
		end
		it "has a seconary name" do
			expect(organization).to respond_to(:secondary_name)
		end
		it "has a secondary phone" do
			expect(organization).to respond_to(:secondary_phone)
		end
		
		it "has a an agreement_one" do
			expect(organization).to respond_to(:agreement_one)
		end		
		
		#We need more of these (but don't replicate above statement)
			
	end

	describe 'enumerations' do
		it { should define_enum_for(:status).with([:approved, :submitted, :rejected, :locked]) }
		it { should define_enum_for(:transportation).with([:yes, :no, :maybe]) }
	end
	
	describe 'relationship' do	
		it "has many users" do
			expect(organization).to have_many(:users)
		end
		it "has many tickets" do
			expect(organization).to have_many(:tickets)
		end		
		it "has many and belongs" do
			expect(organization).to have_and_belong_to_many(:resource_categories)
		end				
	end

	describe 'validation' do
		it "has an email" do
			expect(organization).to validate_presence_of(:email)
		end
		it "has a unique email" do
			expect(organization).to validate_uniqueness_of(:email).case_insensitive()
		end
		it "validates length of name" do 
			expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end
		it "has a unique name" do
			expect(organization).to validate_uniqueness_of(:name).case_insensitive()
		end
		it "validates length of description" do
			expect(organization).to validate_length_of(:description).is_at_most(1020).on(:create)
		end
		#MORE TESTS HERE
			
	end
	
	 #validates :email, format: { with: VALID_EMAIL_REGEX }

	describe "approve" do
		let(:locked_organization) { build(:organization, :locked) }
		let(:rejected_organization) { build(:organization, :rejected) }
		let(:submitted_organization) { build(:organization, :submitted) }
		it "status remains approved if already approved" do
			expect(organization.approve).to eq(:approved) 
		end
	
		it "status changes to approves if status wasn't approved already" do
			expect(locked_organization.approve).to eq(:approved)
			expect(rejected_organization.approve).to eq(:approved)
			expect(submitted_organization.approve).to eq(:approved)
		end
	end

	describe "#to_s" do
		it "has a string representation that is the name" do
	   		expected_result = organization.name
	    	expect(organization.to_s).to eq(expected_result)
		end
	end

    describe 'other' do
		#it 'is persisted' do
		#	expect(organization).to be_persisted
		#end	
	end 
  
end
