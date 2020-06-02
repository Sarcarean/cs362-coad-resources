require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  context 'As a public user' do

    specify 'GET #index' do
      expect(get(:index)).to redirect_to(new_user_session_path)
    end  

    specify 'GET #show' do   
      expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
    end

    specify 'GET #new' do   
      expect(get(:new)).to redirect_to(new_user_session_path)
    end

    specify 'GET #new' do   
      expect(get(:new)).to redirect_to(new_user_session_path)
    end

    specify 'GET #edit' do   
      expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
    end

    specify 'PATCH #update' do   
      expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
    end

    specify 'PATCH #activate' do   
      expect(patch(:activate, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
    end

    specify 'PATCH #deactivate' do   
      expect(patch(:deactivate, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
    end

    specify 'DELETE #destroy' do
      expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path)
    end
	
  end
    
  context 'As organization user' do
    let(:user) { create(:user) }  
    before(:each) { sign_in(user) }

    specify 'GET #index' do
      expect(get(:index)).to redirect_to(dashboard_path)
    end

    specify 'GET #show' do
      expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'GET #new' do   
      expect(get(:new)).to redirect_to(dashboard_path)
    end

    specify 'POST #create' do
      expect(post(:create)).to redirect_to(dashboard_path)
    end

    specify 'GET #edit' do
      expect(get(:edit, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'PATCH #update' do
      expect(patch(:update, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'PATCH #activate' do   
      expect(patch(:activate, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'PATCH #deactivate' do   
      expect(patch(:deactivate, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end

    specify 'DELETE #destroy' do
      expect(delete(:destroy, params: { id: 'FAKE' } )).to redirect_to(dashboard_path)
    end
  end

  context 'As an admin' do
    let(:admin_user) { create(:user, :admin) }  
    before(:each) { sign_in(admin_user) }

    specify 'GET #index' do
      expect(get(:index)).to be_successful
    end

    specify 'GET #new' do   
      expect(get(:new)).to be_successful
    end

    specify 'POST #create' do
      expect(post(:create, params: { resource_category: attributes_for(:resource_category) } )).to redirect_to(resource_categories_path)
    end

    specify 'GET #edit' do
      admin_user = create(:resource_category)
      admin_user.save
      expect(get(:edit, params: { id: admin_user.id })).to be_successful
    end
	
    specify 'PATCH #update' do
	  res_cat = create(:resource_category)  
      cat_attr = attributes_for(:resource_category)
      expect(patch(:update, params: { id: res_cat.id, resource_category: cat_attr } )).to redirect_to(resource_categories_path + "/" + res_cat.id.to_s)   
    end

    specify 'PATCH #activate' do
	  res_cat = create(:resource_category, active: false)
      cat_attr = attributes_for(:resource_category)
      expect(patch(:activate, params: { id: res_cat.id, resource_category: cat_attr } )).to redirect_to(resource_categories_path + "/" + res_cat.id.to_s) 
    end

    specify 'PATCH #deactivate' do   
	  res_cat = create(:resource_category, active: true)
      cat_attr = attributes_for(:resource_category)
      expect(patch(:deactivate, params: { id: res_cat.id, resource_category: cat_attr } )).to redirect_to(resource_categories_path + "/" + res_cat.id.to_s) 
    end

    specify 'DELETE #destroy' do
      res_cat = create(:resource_category)
      expect(delete(:destroy, params: {id: res_cat.id} )).to redirect_to(resource_categories_path)
    end

  end
  
end
