# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, except: %i[edit update destroy]
  get '/external', to: 'projects#external'

  resources :groups, except: %i[edit update destroy]

  resources :logs, only: %i[new create]

  authenticated :user do
    root 'home#home', as: :authenticated_root
  end

  unauthenticated :user do
    root 'home#landing', as: :unauthenticated_root
  end
end
