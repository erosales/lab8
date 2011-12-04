Lab8::Application.routes.draw do
  resources :users

  match '/home', :to => 'pages#home'
  match '/login', :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/signup', :to => 'users#new'
  
  root :to => 'pages#home'
end