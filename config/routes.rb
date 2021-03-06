Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:  'static_pages#home'
  get       '/signup',    to: 'users#new'
  post      '/signup',    to: 'users#create'
  get       '/login',     to: 'sessions#new'
  post      '/login',     to: 'sessions#create'
  delete    '/logout',    to: 'sessions#destroy'
  resources :users
  resources :events
end
