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

			describe 'PATCH #activate' do	 
				specify { expect(patch(:activate, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end

			describe 'PATCH #deactivate' do	 
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

			describe 'PATCH #activate' do	 
				specify { expect(patch(:activate, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
			end

			describe 'PATCH #deactivate' do	 
				specify { expect(patch(:deactivate, params: { id: 'FAKE' } )).to redirect_to(dashboard_path) }
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

			describe 'POST #create' do
				specify { expect(post(:create, params: { resource_category: attributes_for(:resource_category) } )).to redirect_to(resource_categories_path) }
			end

			specify 'GET #edit' do
				admin_user = create(:resource_category)
				admin_user.save
				expect(get(:edit, params: { id: admin_user.id })).to be_successful
			end

			specify 'PATCH #update' do
				resource_category = create(:resource_category)
				expect(patch(:update, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) })).to redirect_to(resource_categories_path + "/" + resource_category.id.to_s)
			end

			# TODO : #activate & #deactivate

			specify 'DELETE #destroy' do
				delete_resource_category_service = create(:resource_category)
				expect(delete(:destroy, params: {id: delete_resource_category_service.id} )).to redirect_to(resource_categories_path)
			end

		end
end
