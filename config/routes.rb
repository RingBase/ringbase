RingBase::Application.routes.draw do

  resources :users
  get '/dashboard', :to => redirect('/#/dashboard'), as: :dashboard

  resources :organizations

  resources :sessions, only: [:new, :create, :destroy]
  get 'login'    => 'sessions#new',     as: 'login'
  post 'login'   => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: 'logout'

  root 'static#main'

  # Route page not found to 404 page
  # get '*a' => 'static#not_found'

end
