Rails.application.routes.draw do

   devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
resources :charges
resources :notes do
  post '/posts/temp',   to: 'posts#create_temp',  as: :temp_post
collection do
    get :search
  end
  member do

    get :profile
  end
end

    get '/notes/search/:show_id' => "notes#search"


get 'pay' => 'api#pay'


  post '/like/:note_id' => 'likes#like', as: 'like'
  delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

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


resources :users, only:[:index] do
 member do
    get :like_notes
end
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



  get '*path', to: 'application#error_404'

end
