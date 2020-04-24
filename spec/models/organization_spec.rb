require 'rails_helper'

RSpec.describe Organization, type: :model do

	let(:organization) { Organization.new() }
	
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

end
