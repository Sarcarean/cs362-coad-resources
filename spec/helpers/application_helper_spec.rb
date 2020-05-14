require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  known_tag = 'Disaster Resource Network'

  it "blank title returns `Disaster Resource Network`" do	
	expect(helper.full_title('')).to eq(known_tag)			
  end
  
  it 'specified title returns known result' do
	expect(helper.full_title('test_title')).to eq('test_title | ' + known_tag)		  
  end
 
end
