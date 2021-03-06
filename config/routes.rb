Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gist_sessions do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[destroy]

  resources :users, only: %i[show] do
    resources :bookings, only: %i[index]
  end

  resources :users, only: %i[show] do
    member do
      get :aboutme
    end
  end

end
