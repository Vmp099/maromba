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
  get 'trainings/routine'
  get 'trainings/:user_id/user' => 'trainings#user', as: 'training_user'
  get 'trainings/routine' => 'trainings#routine', as: 'training_routine'
  get '/trainings/:id/edit' => 'trainings#edit'
  post '/trainings/:id/edit' => 'trainings#update'
  get '/pages/sobre' =>  'sobre'
  get '/pages/regras' =>  'regras'
  get '/users/passwords/new' => 'users#new', as: 'forgot_password'


  resources :trainings
  resources :weigths
  resources :measures
  resources :current_measures
  resources :routines
end
