# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboard#index'
end
