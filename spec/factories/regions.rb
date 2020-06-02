FactoryBot.define do
  
  factory :region do
    name
	
	trait :unspecified_region do
	    name { 'Unspecified' }
  	end
  end 
 
end