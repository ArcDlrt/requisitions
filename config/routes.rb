Rails.application.routes.draw do
  resources :requisitions, except: [:destroy]
  resources :profiles, only: [:new, :create]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }

  root to: 'home#index'
end
