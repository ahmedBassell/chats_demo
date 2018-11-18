require 'rails_helper'

RSpec.describe 'Apps API', type: :request do
  # initialize test data

  let!(:apps) { create_list(:app, 10) }
  let(:app_token) { apps.first.token }

  # Test suite for GET /apps
  describe 'GET /apps' do
    # make HTTP get request before each example
    before { get '/apps' }

    it 'returns apps' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /apps/:token
  describe 'GET /apps/:token' do
    before { get "/apps/#{app_token}" }

    context 'when the record exists' do
      it 'returns the app' do
        expect(json).not_to be_empty
        expect(json['token']).to eq(app_token)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:app_token) { '100' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find App/)
      end
    end
  end

  # Test suite for POST /apps
  describe 'POST /apps' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm' } }

    context 'when the request is valid' do
      before { post '/apps', params: valid_attributes }

      it 'creates a app' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/apps'}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /apps/:token
  describe 'PUT /apps/:token' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/apps/#{app_token}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /apps/:token
  describe 'DELETE /apps/:token' do
    before { delete "/apps/#{app_token}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
