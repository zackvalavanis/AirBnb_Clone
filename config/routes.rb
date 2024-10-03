Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'

  post '/sessions' => 'sessions#create'

  get '/rooms' => 'rooms#index'
  get '/rooms/:id' => 'rooms#show'
  post'/rooms' => 'rooms#create'
  patch '/rooms' => 'rooms#update'
  delete '/rooms' => 'rooms#destroy'


  # Defines the root path route ("/")
  # root "posts#index"
end
