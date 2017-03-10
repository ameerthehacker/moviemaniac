Rails.application.routes.draw do
  devise_for :users, :controllers=>{:registrations=>'user/registrations'}
  resources :movies do
    resources :comments
  end
  root :to => 'movies#index'
  get '/users/:username', :to => 'users#show', :as => :user_profile
end
