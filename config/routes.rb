Rails.application.routes.draw do
  
  resources :gossips, only: [:new, :create, :show, :edit, :update, :destroy]  do
    resources :comments, only: [:new, :create, :index, :destroy]
  end
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]  
  resources :sessions, only: [:new, :create, :destroy]
  resources :city, only: [:show] 
  resources :welcome, only: [:show] 
  resources :contact, only: [:index] 
  resources :team, only: [:index, :create, :show, :edit, :update, :destroy] 
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] 
  resources :home, path: '/', only: [:list]
  get '/', to: 'home#list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end