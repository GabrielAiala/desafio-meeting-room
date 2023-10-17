require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a 200 OK status' do
      get :index
      expect(response).to have_http_status(:found)
    end
  end
end