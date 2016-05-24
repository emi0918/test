Rails.application.routes.draw do




   devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

resources :notes do
collection do
    get :search
  end
  member do
    get :description
    get :images
    get :price
  end
end

    get '/notes/search/:show_id' => "notes#search"


get 'pay' => 'api#pay'


  resources :notes_steps

  root'home#index'

namespace :home do
  get :pro
  get :signage
  get :term
  get :policy
  get :guide
  get :newlisting
  get :service_setting
end

namespace :service_setting do
  get :basic
  get :description
  get :pictures
  get :price
end



  namespace :company do
    get :index
    get :philosophy
    get :question
  end

  namespace :housing do
    get :index
    get :event
    get :lesson
    get :health
    get :others
    get :move
    get :provider

  end
  namespace :dashboard do
    get :index
    get :listing
    get :account
    get :mypage
    get :messages
    get :transaction
  end



namespace :users do
  get :index
  get :account
  get :profile
  get :profile_setting
end

 # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
