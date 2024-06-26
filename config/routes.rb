Rails.application.routes.draw do
  resources :termins do
    collection do
      get :check
    end
  end
  resources :anwesenheitslistes
  resources :fehlzeits
  resources :veranstaltungs
  resources :moduls
  devise_for :users
  get 'pages/home'
  get 'pages/about'
  # Defines the root path route ("/")
  root "termins#index"
  get 'pages/home'
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end