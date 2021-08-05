# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :users do
    member do
      get :boards
      get :articles
    end
  end

  resources :boards do
    resources :posts, shallow: true
  end
end
