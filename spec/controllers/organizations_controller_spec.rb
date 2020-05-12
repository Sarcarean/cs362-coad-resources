require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'As a public user' do
	
	describe 'GET /organizations (NOT ALLOWED)' do
	  specify { expect(get(:index)).to redirect_to(new_user_session_path) }
	end
	
	describe 'POST /organizations (NOT ALLOWED)' do	 
	  specify { expect(post(:create)).to redirect_to(new_user_session_path) }
	end
	
	describe 'GET /organizations/new (NOT ALLOWED)' do	 
	  specify { expect(get(:new)).to redirect_to(new_user_session_path) }
	end
	
	describe 'GET /organization/#show (NOT ALLOWED)' do	 
	  specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	 describe 'GET /organization/#edit (NOT ALLOWED)' do	 
	  specify { expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'PATCH /organization/#update (NOT ALLOWED)' do	 
	  specify { expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'POST #approve (NOT ALLOWED)' do
	  specify { expect(post(:approve, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

	describe 'POST #reject (NOT ALLOWED)' do
	  specify { expect(post(:reject, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	end

  end
  
  context 'As an organization user' do
	let(:user) { create(:user) }	
	before(:each) { sign_in(user) }
	
	describe 'GET /organizations' do
	  specify { expect(get(:index)).to be_successful }
	end
	
	
	describe 'POST /organizations' do	 
	
		#it 'succedes' do
	    #expect_any_instance_of(UserMailer).to receive(:new_organization_application).and_return(nil)
	    #create(:user, :admin)				#added
        #xpect(post(:create, params: { organization: attributes_for(:organization) } )).to be_successful
	  	#end
	end
	
	describe 'GET /organizations/new' do	 
	  specify { expect(get(:new)).to be_successful }
	end
	
	# describe 'GET /organization/#show' do 
	  #org = FactoryBot.create(:organization)
	  #specify { expect(get(:show, params: { id: org.id } )).to be_successful }
	# end

	 # describe 'GET /organization/#edit' do	 
		# specify { expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	# end

	# describe 'PATCH /organization/#update' do	 
		# specify { expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	# end

	describe 'POST #approve' do
	  specify { expect(post(:approve, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
	end

	describe 'POST #reject' do
	  specify { expect(post(:reject, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
	end

  end
  
  context 'As an admin' do
	let(:admin_user) { create(:user, :admin) }	
	before(:each) { sign_in(admin_user) }
	
	describe 'GET /organizations' do
	  specify { expect(get(:index)).to be_successful }
	end
	
	describe 'POST /organizations' do	 
	  specify { expect(post(:create)).to redirect_to(dashboard_path) }
	end
	
	# describe 'GET /organizations/new' do	 
	  # specify { expect(get(:new)).to redirect_to(new_user_session_path) }
	# end
	
	# describe 'GET /organization/#show' do	 
	  # specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	# end

	 # describe 'GET /organization/#edit' do	 
		# specify { expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	# end

	# describe 'PATCH /organization/#update' do	 
		# specify { expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	# end

	# describe 'POST #approve' do
	  # #Do something here
	  # specify { expect(post(:approve)).to redirect_to(organizations_path) }
	# end

	# describe 'POST #reject' do
		# specify { expect(post(:reject, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
	# end

  end


end
