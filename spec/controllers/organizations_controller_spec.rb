require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'As a public user' do
	
	specify 'GET #index' do
		expect(get(:index)).to redirect_to(new_user_session_path)
	end

	specify 'GET #new' do	 
		expect(get(:new)).to redirect_to(new_user_session_path)
	end
	
	specify 'POST #create' do	 
		expect(post(:create)).to redirect_to(new_user_session_path)
	end

	specify 'GET #edit' do	 
		expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
	end		
	
	specify 'PATCH #update' do	 
		expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
	end
		
	specify 'GET #show' do	 
		expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
	end

	specify 'POST #approve' do
		expect(post(:approve, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
	end

	specify 'POST #reject' do
		expect(post(:reject, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
	end

  end
  
  context 'As an organization user' do
	let(:user) { create(:user) }	
	before(:each) { sign_in(user) }
	
	specify 'GET #index' do
		expect(get(:index)).to be_successful
	end

	specify 'GET #new' do
		expect(get(:new)).to be_successful
	end	
	
	specify 'POST #create' do	
		FactoryBot.create(:user, :admin)	#Create admin so SMTP will work
		expect(post(:create, params: { organization: attributes_for(:organization) } )).to redirect_to(organization_application_submitted_path)
	end
	
	specify 'GET #edit' do
		user.organization = create(:organization, :approved)
		user.save
		expect(get(:edit, params: { id: user.organization.id })).to be_successful
	end
	
	specify 'PATCH #update' do	 
		expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
	end
	
	specify 'GET #show' do	 
		expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
	end

	specify 'POST #approve' do
		expect(post(:approve, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
	end

	specify 'POST #reject' do
		expect(post(:reject, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
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
