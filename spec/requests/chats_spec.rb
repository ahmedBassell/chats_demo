require 'rails_helper'

RSpec.describe 'Chats API' do
  # Initialize the test data

  let!(:apps) { create_list(:app, 2) }
  let!(:app_token) { apps.first.token }
  let!(:app_id) { apps.first.id }

  let!(:chats) { create_list(:chat, 2, app_token: app_token, app_id: app_id) }
  let!(:number) { chats.first.number }


  # Test suite for GET /apps/:app_token/chats
  describe 'GET /apps/:app_token/chats' do
    before { get "/apps/#{app_token}/chats" }

    context 'when app exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all app chats' do
        expect(json.size).to eq(2)
      end
    end

    context 'when app does not exist' do
      let(:app_token) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find App/)
      end
    end
  end

  # Test suite for GET /apps/:app_token/chats/:id
  describe 'GET /apps/:app_token/chats/:number' do
    before { get "/apps/#{app_token}/chats/#{number}" }

    context 'when app chat exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the chat' do
        expect(json['number']).to eq(number)
      end
    end

    context 'when app chat does not exist' do
      let(:number) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Chat/)
      end
    end
  end

  # Test suite for PUT /apps/:app_token/chats
  describe 'POST /apps/:app_token/chats' do

    context 'when request attributes are valid' do
      before { post "/apps/#{app_token}/chats" }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for DELETE /apps/:id
  describe 'DELETE /apps/:number' do
    before { delete "/apps/#{app_token}/chats/#{number}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
