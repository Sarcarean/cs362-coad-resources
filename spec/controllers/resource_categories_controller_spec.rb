require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

		context 'As a public user' do

      describe 'GET #index' do
	      specify { expect(get(:index)).to redirect_to(new_user_session_path) }
			end	

			describe 'GET #show' do	 
				specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end

			describe 'GET #new' do	 
				specify { expect(get(:new)).to redirect_to(new_user_session_path) }
			end

			describe 'GET #new' do	 
				specify { expect(get(:new)).to redirect_to(new_user_session_path) }
			end

			describe 'GET #edit' do	 
				specify { expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end

			describe 'PATCH #update' do	 
				specify { expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end

			describe 'PATCH #update' do	 
				specify { expect(patch(:activate, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end

			describe 'PATCH #update' do	 
				specify { expect(patch(:deactivate, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end

			describe 'DELETE #destroy' do
				specify { expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end
		end
		
		context 'As organization user' do
			let(:user) { create(:user) }	
			before(:each) { sign_in(user) }

			describe 'GET #index' do
	  		specify { expect(get(:index)).to redirect_to(dashboard_path) }
			end

			describe 'GET #show' do
				specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end
		end
end
