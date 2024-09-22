Rails.application.routes.draw do
  get 'favorites/index'
  get 'favorites/new'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"

  resources :event_places  # This creates routes for all CRUD actions for event_place
  resources :categories  # This creates routes for all CRUD actions for categories

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
