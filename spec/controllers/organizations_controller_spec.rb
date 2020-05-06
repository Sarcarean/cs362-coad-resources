require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'As a public user' do
	
	describe 'GET /organizations' do
	  specify { expect(get(:index)).to redirect_to(new_user_session_path) }
	end
	
	describe 'POST /organizations' do	 
	  specify { expect(post(:index)).to redirect_to(new_user_session_path) }
	end
	
	describe 'GET /organizations/new' do	 
	  specify { expect(get(:new)).to redirect_to(new_user_session_path) }
	end
	
	describe 'GET /organization/#show' do	 
	  specify { expect(get(:show)).to redirect_to(new_user_session_path) }
	end

	# describe 'GET /organization/#edit' do	 
	  # specify { expect(get(:index)).to redirect_to(new_user_session_path) }
	# end

	# describe 'PATCH /organization/#update' do	 
	  # specify { expect(patch(:index)).to redirect_to(new_user_session_path) }
	# end

	# describe 'DELETE /organization/#delete' do	 
	  # specify { expect(delete(:index)).to redirect_to(new_user_session_path) }
	# end
			
  end
  
  context 'As an organization user' do
	let(:user) { create(:user) }	
	before(:each) { sign_in(user) }
	
	describe 'GET #organizations' do
	  specify { expect(get(:index)).to be_successful }
	end
		
  end
  
  context 'As an admin' do
	let(:admin_user) { create(:user, :admin) }	
	before(:each) { sign_in(admin_user) }
	
	describe 'GET #index' do
	  specify { expect(get(:index)).to be_successful }
	end
	
  end


end
