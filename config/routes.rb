Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  root 'home#index'
  get 'trainings/looper'

  resources :trainings
end
