Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  get 'messages' => 'messages#index'
  get 'messages/new' => 'messages#new'
  post 'messages' => 'messages#create'
  delete 'messages/:id' => 'messages#destroy'
  patch 'messages/:id' => 'messages#update'
  get 'messages/:id/edit' => 'messages#edit'
  get   'users/:id'   =>  'users#show'
end
