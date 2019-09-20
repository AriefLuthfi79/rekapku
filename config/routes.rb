Rekapku::Application.routes.draw do
  get '/login', to: 'sessions#new'

  resource :session, only: [:create, :new]
  resources :dashboards, only: :index

  namespace :admin do
    resources :categories
  end

  scope module: :admin do
    resources :products, :categories
  end
end
