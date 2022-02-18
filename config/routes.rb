Rails.application.routes.draw do
  devise_for :users
  # root to: 'site#index'
  root to: 'groups#index'

  resources :groups, only: %i[index new create show] do
    collection do
      get 'search'
    end
  end
  resources :users, only: %i[show] do
    collection do
      get 'search'
    end
  end
  resources :user_group_relations, only: %i[new create]
  resources :posts, only: %i[new create]
  # namespace :api do
  #   namespace :v1 do
  #     resources :groups, only: %i[index show create]
  #   end
  # end
end
