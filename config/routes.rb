# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games do
    resources :player_characters, only: %i[show]
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'games#index'
end
