SupercarindexDotNet::Application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
  resources :supercars
  # resources :makes
  resources :car_models
  resources :cities
  resources :countries

  resources :makes, :key => :name do
    resources :cities, :key => :name do
      resources :countries, :key => :name
  end
end

  get 'makes/:name', to: 'makes#allmodels', as: :by_makes
  get 'models/:name', to: 'car_models#allmodels', as: :by_models
  get 'cities/:name', to: 'cities#allmodels', as: :by_cities
  get 'countries/:name', to: 'countries#allmodels', as: :by_countries



  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
    
  end

end
