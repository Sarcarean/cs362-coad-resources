require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  
  context 'as a public user' do
	 
    specify 'GET #index' do
      expect(get(:index)).to redirect_to(new_user_session_path)
    end
  
  end
  
  context 'as a signed-in user' do
    let(:user) { create(:user) }	
    before(:each) { sign_in(user) }
	
    specify 'GET #index' do
      expect(get(:index)).to be_successful
    end
	
  end  
  
end
