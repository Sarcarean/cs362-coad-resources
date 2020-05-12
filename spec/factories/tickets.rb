FactoryBot.define do

  factory :ticket do
    name
	description { 'a test ticket' }		
	trait :open do
	  closed { false }
	  name { 'open_ticket' }
	end
	trait :closed do
	  closed { true }
	  name { 'closed_ticket' }
	end
	phone { '+41 44 111 22 33' }
	trait :with_org do
		organization
	end
	region
	resource_category
  end


end