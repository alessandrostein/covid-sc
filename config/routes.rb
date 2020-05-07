Rails.application.routes.draw do
  devise_for :users

  root to: 'hospitals#show'

  resource :hospital, only: %i[show edit update] do
    resources :patients
  end
end
