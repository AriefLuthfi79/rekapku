Rekapku::Application.routes.draw do
  get '/login', to: 'sessions#new'

  resource :session, only: [:create, :new]
  resources :dashboards, only: :index

  namespace :admin do
    resources :categories
  end

  # Category page
  post '/categories', to: "admin/categories#create"
  get '/categories', to: "admin/categories#index"
  get '/categories/new', to: "admin/categories#new", as: "new_category"
  get '/category/:id/edit', to: "admin/categories#edit", as: "edit_category"
  patch '/categories/:id', to: "admin/categories#update", as: "category"
end
