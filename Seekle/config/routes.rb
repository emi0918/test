Rails.application.routes.draw do
  root'home#top'
  get '/notes/new' =>'notes#new'
  post '/notes' => 'notes#create'
  get '/pro' => 'home#pro'


end
