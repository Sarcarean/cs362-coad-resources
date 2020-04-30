FactoryBot.define do
  factory :user do
    email
	password { "fake_password" }
	
    trait :admin do
	  role { :admin }
	  organization_id { nil }	  
	end
	
	trait :organization_approved do
	  role { :organization }
	  organization_id { create(:organization, :approved).id }
	end 
  
    trait :organization_unapproved do
	  role { :organization }
	  organization_id { create(:organization).id }
	end
  
    after(:create) do |user|
	  user.confirm
	end
  
  end
end