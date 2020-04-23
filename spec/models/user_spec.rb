require 'rails_helper'

RSpec.describe User, type: :model do
	
	let(:user) {User.new}
	
	describe "attributes" do
		it "has an email" do
			expect(user).to respond_to(:email)
		end
			
		# MORE TESTS HERE
		
		#email
		#role
		
	end
	
	describe "relationship" do
		specify { expect(user).to belong_to(:organization) }
	end
	
	describe "validations" do
	
		it "validates presence of email" do
			expect(user).to validate_presence_of(:email)
		end
		
		it "validates length of email" do
			expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255)
		end
		
		it "has a unique email" do
			expect(user).to validate_uniqueness_of(:email).case_insensitive()
		end

		it "is not valid without an email" do
			user.email = nil
			expect(user).to_not be_valid(:email)
		end

		it "is not valid without a password" do
			user.password = nil
			expect(user).to_not be_valid(:email)
		end

	end
	
	
end
