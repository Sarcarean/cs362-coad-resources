require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  
  context 'As a public user' do
    # Check to make sure users cannot do anything
    #Redirect to sign in page
	describe 'GET #index' do
	  specify { expect(get(:index)).to redirect_to(new_user_session_path) }
	end

	describe 'GET #show' do
		specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'GET #new' do	 
		specify { expect(get(:new)).to redirect_to(new_user_session_path) }
	end

	describe 'POST #create' do
		specify { expect(post(:create)).to redirect_to(new_user_session_path) }
	end

	describe 'GET #edit' do
		specify { expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'PATCH #update' do
		specify { expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'DELETE #destroy' do
		specify { expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end
  end
  
  context 'As an organization user' do
	# Limited access, send to dashboard
	let(:user) { create(:user) }	
	before(:each) { sign_in(user) }
	
	describe 'GET #index' do
	  specify { expect(get(:index)).to redirect_to(dashboard_path) }
	end

	describe 'GET #new' do	 
		specify { expect(get(:new)).to redirect_to(dashboard_path) }
	end

	describe 'POST #create' do
		specify { expect(post(:create)).to redirect_to(dashboard_path) }
	end

	describe 'GET #edit' do
		specify { expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
	end
		
	describe 'PATCH #update' do
		specify { expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
	end

	describe 'DELETE #destroy' do
		specify { expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
	end

  end
  
  context 'As an admin' do
	let(:admin_user) { create(:user, :admin) }	
	before(:each) { sign_in(admin_user) }
	
	describe 'GET #index' do
	  specify { expect(get(:index)).to be_successful }
	end

	describe 'GET #new' do	 
		specify { expect(get(:new)).to be_successful }
	end

	# describe 'POST #create' do
	#	specify { expect(post(:create, params: { region: attributes_for(:region) })).to be_successful }
	# end
	
  end
  
end
