Rails.application.routes.draw do

  devise_for :users
  root'home#index'
  get '/notes/new' =>'notes#new'
  post '/notes' => 'notes#create'
  get '/pro' => 'home#pro'
  get '/policy'=>'home#policy'
  get '/signage' =>'home#signage'
  get '/term' => 'home#term'
  resources :users, only: [:show, :new, :create]

match '*path' => 'application#error404', via: :all

end
