require 'rails_helper'

RSpec.describe DeleteRegionService do

  context 'delete a region' do
  	
    specify 'with a valid command' do
	  region = build(:region)
	  reg = DeleteRegionService.new(region)
	  reg.run!
	  expect(region.destroyed?).to be_truthy
    end
	
    specify 'with an invalid command' do
	  region = build(:region)
	  reg = DeleteRegionService.new(region)
	  expect(region.destroyed?).to_not be_truthy		#Failed to call reg.run!
    end
	
  end

end
