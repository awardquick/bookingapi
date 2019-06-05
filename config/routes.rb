Rails.application.routes.draw do
      resources :schedules
      resources :bookings
      resources :employees
      resources :clients
      resources :users, param: :_username
      # post '/auth/login', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
      resources :accounts
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
