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
	let(:user) { create(:user, role: 'organization') }	
	before(:each) { sign_in(user) }
	
	specify 'GET #index' do
		expect(get(:index)).to be_successful
	end

	specify 'GET #new' do
		expect(get(:new)).to be_successful
	end	
	
	specify 'POST #create' do
		create(:user, :admin)	#Create admin so SMTP will work
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
	
	specify 'GET #index' do
	  expect(get(:index)).to be_successful
	end
	
	specify 'GET #new' do
		expect(get(:new)).to_not be_successful
	end			
	
	specify 'POST #create' do 
	  expect(post(:create)).to redirect_to(dashboard_path)
	end
	
	specify 'GET #edit' do
		admin_user.organization = create(:organization, :approved)
		admin_user.save
		expect(get(:edit, params: { id: admin_user.organization.id })).to be_successful
	end	
	
	specify 'PATCH #update' do	 
	  admin_user.organization = create(:organization, :approved)
	  admin_user.save  
	  expect(patch(:update, params: { 
	    id: admin_user.organization.id, organization: attributes_for(:organization) 
	  } )).to redirect_to(organizations_path + "/" + admin_user.organization.id.to_s)  
	end
	
	specify 'GET #show' do
		admin_user.organization = create(:organization, :approved)
		admin_user.save
		expect(get(:show, params: { id: admin_user.organization.id } )).to be_successful
	end

	specify 'POST #approve' do
	  user = create(:user, role: 'organization')
	  user.organization = create(:organization, :submitted)
	  user.save
	  expect(post(:approve, params: { id: user.organization.id } )).to redirect_to("/organizations")	
	end

	specify 'POST #reject' do
	  user = create(:user, role: 'organization')
	  user.organization = create(:organization, :submitted)
	  user.save
	  expect(post(:reject, params: { id: user.organization.id, organization: {rejection_reason: 'FAKE'} } )).to redirect_to("/organizations")			
	end
	
	
  end


end
