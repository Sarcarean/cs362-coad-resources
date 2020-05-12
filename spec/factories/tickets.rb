FactoryBot.define do

  factory :ticket do
    name
	description { 'a test ticket' }	
	phone { '+41 44 111 22 33' }	
	trait :open do
	  closed { false }
	  name { 'open_ticket' }
	end
	trait :closed do
	  closed { true }
	  name { 'closed_ticket' }
	end
	trait :with_org do
		organization
	end
	region
	resource_category
  end

end