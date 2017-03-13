Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount actioncable
  mount ActionCable.server => '/cable'
  # root path
  root 'chatrooms#home'
  # devise routes
  devise_for :users
end
