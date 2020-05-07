require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'As a public user' do
	
	describe 'GET /organizations' do
	  specify { expect(get(:index)).to redirect_to(new_user_session_path) }
	end
	
	describe 'POST /organizations' do	 
	  specify { expect(post(:create)).to redirect_to(new_user_session_path) }
	end
	
	describe 'GET /organizations/new' do	 
	  specify { expect(get(:new)).to redirect_to(new_user_session_path) }
	end
	
	describe 'GET /organization/#show' do	 
	  specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	 describe 'GET /organization/#edit' do	 
		specify { expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'PATCH /organization/#update' do	 
		specify { expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'POST #approve' do
		specify { expect(post(:approve, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'POST #reject' do
		specify { expect(post(:reject, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	# describe 'DELETE /organization/#delete' do	 
	# 	specify { expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	# end
			
  end
  
  context 'As an organization user' do
	let(:user) { create(:user) }	
	before(:each) { sign_in(user) }
	
	describe 'GET #organizations' do
	  specify { expect(get(:index)).to be_successful }
	end

	describe 'GET #new' do
		specify { expect(get(:new)).to be_successful }
	end

	describe 'POST #create' do
		specify { expect(post(:create, params: { organization: attributes_for(:organization) } )).to be_successful }
	end

	# describe 'GET #edit' do
	#	specify { expect(get(:edit, params: { id: 'FAKE' } )).to be_successful }
	# end

	# describe 'PUT #update' do	
	# 	specify { expect(put(:update)).to be_successful }
	# end
		
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
	#  	specify { expect(post(:create, params: { organization: attributes_for(:organization) } )).to be_successful }
	# end
	
  end


end
