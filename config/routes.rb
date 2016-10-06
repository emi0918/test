Rails.application.routes.draw do

 default_url_options :host => "seekle.jp"


 devise_for :users 



 resources :about, only:[:index] 

 resources :users, only:[:index] 

 resources :reservations ,only: [:show] do 
  collection do
    get :list
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
     get :mypage
 end
 member do

   get :conversations
   post :reply
 end
end

resources :notes do
   resources :conversations ,except: [:show] 
 resources :reviews, except: [:show,:index]
 resources :reservations ,except: [:show] do
   collection do
     post 'confirm'
     get 'complete'
     get :detail
   end
 end
 collection do
   get :reservations
   get :housing
   get :event
   get :lesson 
   get :health
   get :others
 end
 member do
   get :profile
 end
end



root'home#index'

namespace :home do
  get :pro
  get :signage
  get :term
  get :policy
  get :guide
end

resources :company ,only: [:index]



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


end
