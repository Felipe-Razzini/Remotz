Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard", to: "pages#dashboard"

  resources :projects
  resources :tasks
  resources :alerts, only: %i[index new create destroy]
  resources :suggestions, only: %i[index show create]

end
