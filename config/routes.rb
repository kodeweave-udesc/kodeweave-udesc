Rails.application.routes.draw do
  resources :dashboard, only: [:index]

  namespace :account do
    resources :users
  end

  resources :projects do
    scope module: :projects do
      resources :tasks
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end
