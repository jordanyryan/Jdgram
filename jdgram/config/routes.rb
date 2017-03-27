Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, :controllers => { registrations: 'registrations' }  
  resources :posts, :users
  
  resources :posts do
    resources :comments
  end



end
