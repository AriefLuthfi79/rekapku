Rekapku::Application.routes.draw do
  get '/login', to: 'sessions#new'

  resource :session, only: [:create, :new]
  resources :dashboards, only: :index

  namespace :admin do
    resources :categories
  end

  # Category page
  get '/categories', to: "admin/categories#index"
end
