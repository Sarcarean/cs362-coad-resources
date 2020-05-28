require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    context 'As a public user' do
        describe 'GET #new' do	 
		    	specify { expect(get(:new)).to be_successful }
	    end
    end
end
