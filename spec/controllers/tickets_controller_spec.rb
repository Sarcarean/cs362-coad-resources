require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context 'As a public user' do

    specify 'GET #new' do	 
      expect(get(:new)).to be_successful
    end

    specify 'POST #create' do
	  ticket = create(:ticket)
	  ticket.save
	  expect(post(:create, params: { ticket: attributes_for(:ticket) } )).to be_successful
    end

    specify 'GET #show' do
	  controller.stub(:current_user) { create(:user) }
	  expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end
	
    specify 'POST #capture' do
	  expect(post(:capture, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'POST #release' do
	  expect(post(:release, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'PATCH #close' do
	  controller.stub(:current_user) { create(:user) }
	  expect(patch(:close, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'DELETE #destroy' do
	  expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end
  end

  context 'As an organization user' do
    let(:user) { create(:user, role: 'organization') }	
    before(:each) { sign_in(user) }

    specify 'GET #new' do	 
	  expect(get(:new)).to be_successful
    end

    specify 'POST #create' do
	  ticket = create(:ticket)
	  ticket.save
	  expect(post(:create, params: { ticket: attributes_for(:ticket) } )).to be_successful
    end

    specify 'GET #show' do
	  expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)  
    end

    specify 'POST #capture' do  
	  expect(post(:capture, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)  
    end
	
    specify 'POST #release' do    
      user.organization = create(:organization, :approved)  
	  myticket = create(:ticket, :open)
	  myticket.organization_id = user.organization_id  
	  myticket.save
	  user.save	  	  
	  expect(post(:release, params: { id: myticket.id } )).to redirect_to(dashboard_path + "#tickets:organization")
    end
	
    specify 'POST #release but with an unassigned ticket' do	  
	  user.organization = create(:organization, :approved)  
	  myticket = create(:ticket, :open)
	  myticket.save
	  user.save
	  expect(post(:release, params: { id: myticket.id } )).to be_successful
    end	
	
    specify 'PATCH #close' do
      user.organization = create(:organization, :approved)  
	  myticket = create(:ticket, :open)
	  myticket.organization_id = user.organization_id  
	  myticket.save
	  user.save
	  expect(patch(:close, params: { id: myticket.id } )).to redirect_to(dashboard_path + "#tickets:organization")	
    end
	
    specify 'PATCH #close but fails because user does not own ticket' do
      user.organization = create(:organization, :approved)  
	  myticket = create(:ticket, :open)
	  myticket.save
	  user.save
	  expect(patch(:close, params: { id: myticket.id } )).to be_successful
    end	
	
    specify 'DELETE #destroy' do
	  expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end
  end

  context 'As an admin user' do
    let(:admin_user) { create(:user, :admin) }	
    before(:each) { sign_in(admin_user) }

    specify 'GET #new' do	 
	  expect(get(:new)).to be_successful
    end

    specify 'POST #create' do
	  ticket = create(:ticket)
	  ticket.save
	  expect(post(:create, params: { ticket: attributes_for(:ticket) } )).to be_successful
    end

    specify 'GET #show' do	
	  ticket = create(:ticket)
	  expect(get(:show, params: {id: ticket.id})).to be_successful
    end

    specify 'POST #capture' do
	  expect(post(:capture, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)  
    end

    specify 'POST #release' do	  
	  admin_user.organization = create(:organization, :approved)  
	  myticket = create(:ticket, :open)
	  myticket.organization_id = admin_user.organization_id  
	  myticket.save
	  admin_user.save
	  expect(post(:release, params: { id: myticket.id } )).to redirect_to(dashboard_path + "#tickets:captured")	  
    end

    specify 'PATCH #close' do
	  ticket = create(:ticket) 
	  expect(patch(:close, params: { id: ticket.id } )).to redirect_to(dashboard_path + "#tickets:open")	  
    end

    specify 'DELETE #destroy' do
	  ticket = create(:ticket) 
	  expect(delete(:destroy, params: { id: ticket.id } )).to redirect_to(dashboard_path + "#tickets")
    end
  end
  
  
end
