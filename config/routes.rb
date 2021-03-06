Rails.application.routes.draw do
  resources :polls do
    post 'votes', to: 'polls#create_vote'
  end


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # post '/polls/:id/votes', to: 'polls#create_vote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'static_pages#home'
resources :users do
  member do
    get :following, :followers
  end
end
resources :account_activations, only: [:edit]
resources :password_resets, only: [:new, :create, :edit, :update]
resources :relationships, only: [:create, :destroy]
end
