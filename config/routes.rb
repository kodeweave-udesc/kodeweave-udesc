Rails.application.routes.draw do
  get 'tasks/index'
  resources :dashboard, only: [:index]

  namespace :account do
    resources :users
  end

  resources :projects do
    get :schedule

    scope module: :projects do
      resources :tasks
    end
  end

  resources :tasks, only: [:index]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end
