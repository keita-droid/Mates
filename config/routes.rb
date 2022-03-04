Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root to: 'site#index'
  root to: 'groups#index'

  resources :groups, only: %i[index new create show edit update] do
    collection do
      get 'search'
    end
    resources :requests, only: %i[new create destroy index]
  end
  resources :users, only: %i[show edit update] do
    collection do
      get 'search'
    end
  end
  resources :user_group_relations, only: %i[new create]
  resources :posts, only: %i[create update destroy]
  # namespace :api do
  #   namespace :v1 do
  #     resources :groups, only: %i[index show create]
  #   end
  # end
end
