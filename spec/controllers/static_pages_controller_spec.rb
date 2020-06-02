require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

    context 'As a public user' do

        specify 'GET #index' do
		    expect(get(:index)).to be_successful
        end
        
    end

    context 'As an organization user' do
        let(:user) { create(:user) }	
        before(:each) { sign_in(user) }

        specify 'GET #index' do
		    expect(get(:index)).to be_successful
	    end

    end

    context 'As an admin user' do
        let(:admin_user) { create(:user, :admin) }	
        before(:each) { sign_in(admin_user) }

        specify 'GET #index' do
		    expect(get(:index)).to be_successful
        end
        
    end
end
