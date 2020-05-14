require 'rails_helper'

RSpec.describe TicketsHelper, type: :helper do
   
	it "US phone number is normalized" do
      expect(helper.format_phone_number("541-654-6543")).to eq("+15416546543")		
	end
	  
end
