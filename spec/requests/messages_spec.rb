require 'rails_helper'

RSpec.describe 'Messages API' do
  let!(:apps) { create_list(:app, 1) }
  let!(:app_token) { apps.first.token }
  let!(:app_id) { apps.first.id }

  let!(:chats) { create_list(:chat, 2, app_token: app_token, app_id: app_id) }
  let!(:chat_number) { chats.first.number }
  let!(:chat_id) { chats.first.id }

  let!(:messages) { create_list(:message, 5, chat_number: chat_number, chat_id: chat_id) }
  let!(:number) { messages.first.number }

  # Test suite for GET /apps/:app_token/chats/:chat_number/messages
  describe 'GET /apps/:app_token/chats/:chat_number/messages' do
    before { get "/apps/#{app_token}/chats/#{chat_number}/messages" }

    context 'when app exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all app chats' do
        expect(json.size).to eq(5)
      end
    end

    context 'when app does not exist' do
      let(:chat_number) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Chat/)
      end
    end
  end

  # Test suite for GET /apps/:app_token/chats/:chat_number/messages
  describe 'GET /apps/:app_token/chats/:chat_number' do
    before { get "/apps/#{app_token}/chats/#{chat_number}/messages/#{number}" }

    context 'when message exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the message' do
        expect(json['number']).to eq(number)
      end
    end

    context 'when app chat does not exist' do
      let(:number) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Message/)
      end
    end
  end

  # Test suite for POST /apps/:app_token/chats/:chat_number/messages
  describe 'POST /apps/:app_token/chats/:chat_number/messages' do

    context 'when request attributes are valid' do
      before { post "/apps/#{app_token}/chats/#{chat_number}/messages" }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for DELETE /apps/:id
  describe 'DELETE /apps/:app_token/chats/:chat_number/messages/:number' do
    before { delete "/apps/#{app_token}/chats/#{chat_number}/messages/#{number}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
