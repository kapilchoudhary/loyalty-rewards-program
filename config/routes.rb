# frozen_string_literal: true

Rails.application.routes.draw do
  resources :invoices
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
