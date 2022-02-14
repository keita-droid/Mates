Rails.application.routes.draw do
  devise_for :users
  root to: 'site#index'

  namespace :api do
    namespace :v1 do
      # get 'groups/members', to: 'groups#show'
      resources :groups, only: %i[index show create]
    end
  end
end
