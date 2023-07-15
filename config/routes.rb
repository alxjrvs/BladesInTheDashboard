# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :games, only: %i[index show] do
    get '/join', to: 'games#join'
    resources :player_characters, only: %i[index new create show update] do
      resources :trauma, only: %i[update]
      resources :harms, only: %i[update]
      resources :special_abilities, only: %i[update]
      resources :contacts, only: %i[update]
      resources :items, only: %i[update]
    end
  end

  resources :player_characters, only: %i[show update] do
    resources :harms, only: %i[update create]
  end

  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  root 'games#index'
end
