require 'rails_helper'

RSpec.describe DeleteResourceCategoryService do

  context 'delete a resource category' do
  	
    specify 'with a valid command' do
	  res_categories = create(:resource_category)
	  cat_service = DeleteResourceCategoryService.new(res_categories)
	  cat_service.run!
	  expect(res_categories.destroyed?).to be_truthy	  
    end
	
    specify 'with an invalid command' do
	  res_categories = create(:resource_category)
	  cat_service = DeleteResourceCategoryService.new(res_categories)
	  expect(res_categories.destroyed?).to_not be_truthy	  
    end
	
  end

end
