# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games, only: %i[index show] do
    resources :player_characters, only: %i[index new create edit show]
  end
  devise_for :users
  root 'games#index'
end
