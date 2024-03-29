Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in', as: 'guest_user'
  end
  root to: 'groups#index'
  
  resources :groups do
    collection do
      get 'search'
    end
    member do
      get 'delete'
    end
    member do
      get 'invites'
    end
    resources :requests, only: %i[create destroy index]
  end

  resources :users, only: %i[show edit update destroy] do
    collection do
      get 'search'
    end
    resources :invites, only: %i[create destroy index]
  end
  get '/users/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'

  resources :user_group_relations, only: %i[create destroy]
  resources :posts, only: %i[create update destroy]

  namespace :helps do
    resource :about, only: %i[show]
    resource :manual, only: %i[show]
    resource :policies, only: %i[show]
  end
end
