Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/users' => 'users#create'
  
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :recipies
end
