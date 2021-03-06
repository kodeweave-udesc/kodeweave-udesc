Rails.application.routes.draw do
  get 'tasks/index'
  resources :dashboard, only: [:index]

  namespace :account do
    resources :users
  end

  resources :projects do
    get :schedule
    get :dashboard

    scope module: :projects do
      resources :tasks do
        post :start
        post :finish
      end
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
