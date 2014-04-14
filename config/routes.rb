RingBase::Application.routes.draw do

  resources :users
  get '/dashboard', :to => redirect('/#/dashboard'), as: :dashboard

  resources :organizations do
    member do
      get 'invite' => 'organizations#invite'
      post 'invitations' => 'organizations#invitations'
    end
  end

  get '/invitations/:token' => 'organizations#complete_invitation', as: 'complete_invitation'
  post 'invitations/:token' => 'organizations#complete_invitation', as: 'post_complete_invitation'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login'    => 'sessions#new',     as: 'login'
  post 'login'   => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: 'logout'

  root 'static#main'

  # Route page not found to 404 page
  # get '*a' => 'static#not_found'

end
