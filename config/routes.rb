Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only:[:create, :new, :edit, :update]
    # get '/doses/new', to: 'doses#new'
    # post '/does', to: 'doses#create'
  end
  resources :doses, only:[:destroy]
  root to: 'cocktails#index'
end
