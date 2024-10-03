Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Users
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  # Sessions
  post '/sessions' => 'sessions#create'
  #Rooms
  get '/rooms' => 'rooms#index'
  get '/rooms/:id' => 'rooms#show'
  post'/rooms' => 'rooms#create'
  patch '/rooms/:id' => 'rooms#update'
  delete '/rooms/:id' => 'rooms#destroy'
  #Third Party API
  get '/information/fetch_and_store' => 'information#fetch_and_store_data'
  #Room Images
  get '/roomimages' => 'roomimages#index'
  get '/roomimages/:id' => 'roomimages#show'
  post'/roomimages' => 'roomimages#create'
  patch '/roomimages/:id' => 'roomimages#update'
  delete '/roomimages/:id' => 'roomimages#destroy'
  #Reservations
  get '/reservations' => 'reservations#index'
  get '/reservations/:id' => 'reservations#show'
  post'/reservations' => 'reservations#create'
  patch '/reservations/:id' => 'reservations#update'
  delete '/reservations/:id' => 'reservations#destroy'
  #Reviews
  get '/reviews' => 'reviews#index'
  get '/reviews/:id' => 'reviews#show'
  post'/reviews' => 'reviews#create'
  patch '/reviews/:id' => 'reviews#update'
  delete '/reviews/:id' => 'reviews#destroy'

  # Defines the root path route ("/")
  # root "posts#index"
end
