Rails.application.routes.draw do

 default_url_options :host => "seekle.jp"


 devise_for :users 



 resources :users, only:[:index] do
  collection do
    get :history
  end
end

devise_for :providers, controllers: {
  sessions:      'providers/sessions',
  passwords:     'providers/passwords',
  registrations: 'providers/registrations'
}

resources :providers, only:[:index,:edit,:update,:show ]  do
 collection do
   get :profile
   get :inbox
 end
 member do
   get :mypage
   get :conversations
   post :reply
 end
end

resources :notes do
   resources :conversations ,except: [:show] 
 resources :reviews, except: [:show,:index]
 resources :reservations do
   collection do
     post 'confirm'
     get 'complete'
   end
 end
 collection do
   get :reservations
   get :search
 end
 member do
   get :profile
 end
end

get '/notes/search/:note_id' => "notes#search"

root'home#index'

namespace :home do
  get :pro
  get :signage
  get :term
  get :policy
  get :guide
end

namespace :company do
  get :index 
  get :question
end

namespace :category do
  get :housing
  get :event
  get :lesson
  get :health
  get :others
end

resources :conversations ,only: [:show] do
  member do
   post :reply
 end
end

 # mailbox folder routes
 get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
 get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent


get '*path', controller: 'application', action: 'render_404'
end
