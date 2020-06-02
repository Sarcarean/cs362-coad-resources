require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  context 'any user accessing static page' do
	 
    specify 'GET #index' do
      expect(get(:index)).to be_successful
    end
  
  end  
 
end
