Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :workout_exercises
  resources :exercises, only: [:index, :new, :create]
  resources :workouts
  resources :users
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
