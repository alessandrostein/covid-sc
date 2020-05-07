Rails.application.routes.draw do
  devise_for :users

  root to: 'hospitals#index'

  resources :hospitals, only: %i[index show edit update] do
    resources :patients
  end
end
