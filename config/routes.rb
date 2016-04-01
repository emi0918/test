Rails.application.routes.draw do

  devise_for :users
  root'home#index'
  namespace :company do
    get :index
    get :philosophy
    get :question
  end
  resources :home, only: [:index]
  namespace :housing do
    get :index
    get :move
  end
  resources :dashboard, only: [:index]
  get '/notes/new' =>'notes#new'
  post '/notes' => 'notes#create'
  get '/pro' => 'home#pro'
  get '/policy'=>'home#policy'
  get '/signage' =>'home#signage'
  get '/term' => 'home#term'

# match '*path' => 'application#error404', via: :all

end
