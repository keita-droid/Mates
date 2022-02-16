Rails.application.routes.draw do
  devise_for :users
  # root to: 'site#index'
  root to: 'groups#index'

  resources :groups, only: %i[index new create show]
  # namespace :api do
  #   namespace :v1 do
  #     resources :groups, only: %i[index show create]
  #   end
  # end
end
