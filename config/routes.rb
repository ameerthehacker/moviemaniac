Rails.application.routes.draw do
  devise_for :users, :controllers=>{:registrations=>'user/registrations'}
  resources :movies do
    resources :comments
  end
  root :to => 'movies#index'
  post '/users/search', :to=>'users#search', :as=> :user_search  
  get '/users/:username', :to => 'users#show', :as => :user_profile
  get '/users/:user_id/follow', :to=>'users#follow', :as=> :user_follow
  get '/users/:user_id/unfollow', :to=>'users#unfollow', :as=> :user_unfollow
  get '/users/:username/following', :to=>'users#following', :as=> :user_following
  
end
