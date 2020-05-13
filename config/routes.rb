Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users,
             { class_name: 'User' }.merge(ActiveAdmin::Devise.config)

  ActiveAdmin.routes(self)

  root to: 'hospitals#show'

  resource :hospital, only: %i[show edit update] do
    resources :patients
  end
end
