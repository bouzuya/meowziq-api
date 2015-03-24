Rails.application.routes.draw do
  resources :songs, only: [:index, :create, :show, :update, :destroy]
  root 'songs#index'
end
