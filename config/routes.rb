Rails.application.routes.draw do

  root'home#index'
  get '/notes/new' =>'notes#new'
  post '/notes' => 'notes#create'
  get '/pro' => 'home#pro'
  resources :users, only: [:show, :new, :create]



end
