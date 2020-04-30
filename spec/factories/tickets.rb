FactoryBot.define do

  factory :ticket do
    name
	description { 'a test ticket' }	
	closed { false }
    phone { '+41 44 111 22 33' }
	region_id { create(:region).id }
	resource_category_id { create(:resource_category).id }
  end


end