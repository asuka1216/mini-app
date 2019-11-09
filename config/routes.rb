Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  get 'messages' => 'messages#index'
  get 'messages/new' => 'messages#new'
  post 'messages' => 'messages#create'
  get   'users/:id'   =>  'users#show'
end
