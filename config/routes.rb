Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :project, only: %i[index new create show]
  root 'project#index'

  get '/home', to: 'home#home'
end
