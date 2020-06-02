require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  context 'As a public user' do

    specify 'GET #index' do
      expect(get(:index)).to redirect_to(new_user_session_path)
    end
    
  end

  context 'As an organization user' do
    let(:user) { create(:user) }	
    before(:each) { sign_in(user) }
    
    specify 'GET #index' do
      expect(get(:index)).to be_successful
    end
	
    specify 'Get Open tickets' do
      expect(get(:index, params: { status: 'Open' })).to be_successful
    end	
	
    specify 'Get Closed tickets' do
      expect(get(:index, params: { status: 'Closed' })).to be_successful
    end	
	
    specify 'Get Captured tickets' do
      expect(get(:index, params: { status: 'Captured' })).to be_successful
    end	

    specify 'Get My Captured tickets' do
      expect(get(:index, params: { status: 'My Captured' })).to be_successful
    end		
	
    specify 'Get My Closed tickets' do
      expect(get(:index, params: { status: 'My Closed' })).to be_successful
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
