require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

		context 'As a public user' do
			
      describe 'GET #new' do	 
		    specify { expect(get(:new)).to be_successful }
			end
			
			specify 'POST #create' do
				ticket = create(:ticket)
				ticket.save
				expect(post(:create, params: { ticket: attributes_for(:ticket) } )).to be_successful
			end

			# NoMethodError : admin? 
			# describe 'GET #show' do
			#	specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			# end

			describe 'POST #capture' do
				specify { expect(post(:capture, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end

			describe 'POST #release' do
				specify { expect(post(:release, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end

			# TODO : #close

			describe 'DELETE #destroy' do
				specify { expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end
		end
		
		context 'As an organization user' do
			let(:user) { create(:user) }	
			before(:each) { sign_in(user) }

			describe 'GET #new' do	 
				specify { expect(get(:new)).to be_successful }
			end

			specify 'POST #create' do
				ticket = create(:ticket)
				ticket.save
				expect(post(:create, params: { ticket: attributes_for(:ticket) } )).to be_successful
			end

			describe 'GET #show' do
				specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end

			describe 'POST #capture' do
				specify { expect(post(:capture, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end

			describe 'POST #release' do
				specify { expect(post(:release, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end

			describe 'PATCH #close' do
				specify { expect(patch(:close, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end

			describe 'DELETE #destroy' do
				specify { expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end
		end

		context 'As an admin user' do
			let(:admin_user) { create(:user, :admin) }	
			before(:each) { sign_in(admin_user) }

			describe 'GET #new' do	 
				specify { expect(get(:new)).to be_successful }
			end

			specify 'POST #create' do
				ticket = create(:ticket)
				ticket.save
				expect(post(:create, params: { ticket: attributes_for(:ticket) } )).to be_successful
			end
		end
end
