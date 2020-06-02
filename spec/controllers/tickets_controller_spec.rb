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
    let(:user) { create(:user) }	
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
	  expect(post(:release, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'PATCH #close' do
	  expect(patch(:close, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
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
	  expect(post(:release, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'DELETE #destroy' do
	  ticket = create(:ticket) 
	  expect(delete(:destroy, params: { id: ticket.id } )).to redirect_to(dashboard_path + "#tickets")
    end
  end
  
end
