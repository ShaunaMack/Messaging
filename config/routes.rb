Rails.application.routes.draw do
  
  get '/search', to: 'pages#search', as: "search_page"
  
  resources :mentors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]
  resources :profiles
  resources :mentorships
  
  root to: 'pages#welcome'


end
