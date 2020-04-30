FactoryBot.define do
  factory :organization do
    email
	name
	phone { '555-555-5555' }
	description { 'a test organization' }
	liability_insurance { true }
	primary_name { 'primary name' }
	secondary_name { 'secondary name' }
	title { 'title' }
	transportation { :yes }
	
	trait :approved do
	  status { 0 }
	end
	
	trait :rejected do
	  status { 2 }
	end
	
	trait :locked do
	  status { 3 }
	end
	
  end
end