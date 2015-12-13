Rails.application.routes.draw do


  get 'signup', to:'users#new'
  get 'question', to:'talkroom#new'
  root to: 'welcome#index'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  resources :users do
    member do
      get :favcoms, :favtalks, :followings, :followers
    end
  end

  resources :comments
  resources :users
  resources :talkrooms
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favoriteships, only: [:create, :destroy]
  resources :favtalkships, only: [:create, :destroy]

end
