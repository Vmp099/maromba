Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  root 'home#index'
  get 'trainings/looper'
  delete 'trainings/:id/delete' => 'trainings#destroy', as: 'trainings_delete'
  get '/trainings/:id/delete' => 'trainings#destroy'
  delete 'measures/:id/delete' => 'measures#destroy', as: 'measures_delete'
  get '/measures/:id/delete' => 'measures#destroy'


  resources :trainings
  resources :weigths
  resources :measures
  resources :current_measures
end
