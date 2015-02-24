SupercarindexDotNet::Application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
  resources :supercars
  resources :makes
  resources :car_models
  resources :cities
  resources :countries
  
  # get 'makes/:name', to: 'makes#index', as: :by_makes


  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
    
  end

end
