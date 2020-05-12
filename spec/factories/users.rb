FactoryBot.define do
  factory :user do
    email
	password { "fake_password" }
	
    trait :admin do
	  role { :admin }	  
	end
	
	trait :organization_approved do
	  role { :organization }
	  association :organization, factory: [:organization, :approved]
	end 
  
    trait :organization_unapproved do
	  role { :organization }
	  organization
	end
  
    after(:create) do |user|
	  user.confirm
	end
  
  end
end