Rails.application.routes.draw do
  resources :songs
  root to: 'visitors#index'
  get 'about' => 'visitors#about'
  devise_for :users, :controllers => { registrations: 'registrations' }
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :users
end
