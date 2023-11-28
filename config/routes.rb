Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  get "pages/dashboard", to: "pages#dashboard", as: :dashboard

  resources :projects
  resources :tasks

end
