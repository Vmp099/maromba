Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  root 'home#index'
  get '/trainings/number_of_trainings'
  post '/trainings/number_of_trainings'

  resources :trainings
end
