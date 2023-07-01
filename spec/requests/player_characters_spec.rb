# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PlayerCharacters', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/player_characters/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/player_characters/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/player_characters/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/player_characters/show'
      expect(response).to have_http_status(:success)
    end
  end
end
