Rails.application.routes.draw do
  resources :songs, only: [:index, :create, :show, :update, :destroy]
  resource :status, only: [:show, :update]
  root 'songs#index'
end
