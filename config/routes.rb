Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations=>'user/registrations' }
  resources :movies do
    resources :comments
  end
  root :to => 'movies#index'
  # to search users
  post '/users/search', :to=>'users#search', :as => :user_search  
  # get user profile
  get '/:username', :to => 'users#show', :as => :user_profile
  # get users whom :username is following
  get '/:username/following', :to=>'users#following', :as => :user_following
  # follow a user
  get '/users/:user_id/follow', :to=>'users#follow', :as => :user_follow
  # unfollow a user
  get '/users/:user_id/unfollow', :to=>'users#unfollow', :as => :user_unfollow
  post '/users/:user_id/update_avatar', :to=>'users#update_avatar', :as => :user_avatar_update
  
end
