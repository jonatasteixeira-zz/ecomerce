Rails.application.routes.draw do
  resources :items
  
  get     '/logout'                         => 'sessions#destroy'
  post    '/login'                          => 'sessions#create'
  get     '/login'                          => 'sessions#new'
  get     '/signup'                         => 'users#new'
  get     '/users'                          => 'users#index'
  post    '/users'                          => 'users#create'
  post    '/users/update'                   => 'users#update'
  delete  '/users/:id'                      => 'users#destroy'
  
  root "items#index"
end
