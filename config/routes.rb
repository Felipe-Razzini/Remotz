Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard", to: "pages#dashboard"

  resources :projects
  resources :tasks do
    collection do
      get :all
    end
  end
  resources :alerts, only: %i[index new create destroy]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :suggestions, only: %i[index show create]
  resources :calendars, only: [] do
    collection do
      get :month
      get :week
    end
  end
end
