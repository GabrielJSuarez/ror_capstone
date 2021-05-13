Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects
  resources :groups
  resources :logs
  get '/external', to: 'projects#external'
  root 'home#home'
end
