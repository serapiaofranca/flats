require 'rails_helper'

describe "Property Owner authentication" do
    it 'cannot property_create without login' do
        post '/properties'

        expect(response).to redirect_to(new_property_owner_session_path)
    end
    
    it 'cannot property_new form unless authenticated' do
        get '/properties/new'

        expect(response).to redirect_to(new_property_owner_session_path)
    end
end
