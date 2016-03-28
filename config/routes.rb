Rails.application.routes.draw do

  devise_for :users
  root'home#index'
  resources :home, only: [:index]
  resources :housing, only: [:index]
  resources :dashboard, only: [:index]
  get '/notes/new' =>'notes#new'
  post '/notes' => 'notes#create'
  get '/pro' => 'home#pro'
  get '/policy'=>'home#policy'
  get '/signage' =>'home#signage'
  get '/term' => 'home#term'

# match '*path' => 'application#error404', via: :all

end
