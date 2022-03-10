Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'groups#index'
  
  resources :groups, only: %i[index new create show edit update] do
    collection do
      get 'search'
    end
    resources :requests, only: %i[new create destroy index]
  end
  resources :users, only: %i[show edit update destroy] do
    collection do
      get 'search'
    end
  end
  get '/users/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'

  resources :user_group_relations, only: %i[new create]
  resources :posts, only: %i[create update destroy]

end
