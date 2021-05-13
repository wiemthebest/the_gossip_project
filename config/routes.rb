Rails.application.routes.draw do
  
  resources :gossips, only: [:new, :create, :show, :edit, :update, :destroy]  do
    resources :comments, only: [:new, :create, :index, :destroy]
  end
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]  
  resources :sessions, only: [:new, :create, :destroy]
  get 'city/:id', to: 'city#show'
  get '/', to: 'home#list'
  get 'welcome/:first_name', to: 'welcome#showName'
  get 'contact', to: 'contact#index'
  get 'team', to: 'team#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end