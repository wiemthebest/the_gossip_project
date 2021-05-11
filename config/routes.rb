Rails.application.routes.draw do
  resources :gossips do
    resources :comments
    resources :comments, only: [:new, :create, :index, :destroy]
  end
  get 'author/:id', to: 'author#index'
  get 'potin/:id', to: 'potin#show'
  get '/', to: 'home#list'
  get 'welcome/:first_name', to: 'welcome#showName'
  get 'contact', to: 'contact#index'
  get 'team', to: 'team#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

