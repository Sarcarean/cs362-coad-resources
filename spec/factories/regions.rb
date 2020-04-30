FactoryBot.define do
  
  factory :region do
    name { 'Fake' }
	
	trait :unspecified_region do
	  name { 'Unspecified' }
	end
  end
  
  # FactoryBot.define do
    # factory :ticket do
	  # name { 'Fake' }
	  # organization
    # end
  # end
 
  # FactoryBot.define do
    # factory :organization do
	  # name { 'Fake' }
    # end
  # end  
 
end