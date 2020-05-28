require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

    context 'As a public user' do
      describe 'GET #index' do
	      specify { expect(get(:index)).to redirect_to(new_user_session_path) }
			end
			describe 'GET #show' do	 
				specify { expect(get(:show, params: { id: 'FAKE' } )).to redirect_to(new_user_session_path) }
			end
    end
end
