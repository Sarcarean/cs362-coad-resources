require 'rails_helper'

RSpec.describe DashboardHelper, type: :helper do
   
  describe DashboardHelper do

    it "returns admin_dashboard" do
      user = double() #Create test double
      user.stub(:admin?) { true }
	  expect(helper.dashboard_for(user)).to eq('admin_dashboard')
    end

    it "returns organization_submitted_dashboard" do
      user = double() #Create test double
      user.stub(:admin?) { false }	  
      user.stub_chain(:organization, :submitted?).and_return(true)
	  expect(helper.dashboard_for(user)).to eq('organization_submitted_dashboard')		  
    end
    
    it "returs organization_approved_dashboard" do
      user = double() #Create test double
      user.stub(:admin?) { false }	 
      user.stub_chain(:organization, :submitted?).and_return(false)
	  user.stub_chain(:organization, :approved?).and_return(true)	  
      expect(helper.dashboard_for(user)).to eq('organization_approved_dashboard')			  
	end
	
	it "returns unknown users to dashboard" do
      user = double() #Create test double
      user.stub(:admin?) { false }	 
      user.stub_chain(:organization, :submitted?).and_return(false)
	  user.stub_chain(:organization, :approved?).and_return(false)		   
	  expect(helper.dashboard_for(user)).to eq('create_application_dashboard')  
	end
    
  end  
  
end
