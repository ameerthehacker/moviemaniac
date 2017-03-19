class UsersController < ApplicationController
    before_action :set_user, :only=>[:follow, :unfollow, :update_avatar]

    def show 
        @user=User.find_by_username(params[:username]).decorate
    end
    def search
        @users=User.where('(users.username LIKE ? OR users.email LIKE ?) AND users.username <> ?', "#{params[:search_term]}%", "#{params[:search_term]}%", current_user.username)
    end
    def follow
        @user.followers<<current_user
        respond_to do |format|
            format.js
        end
    end
    def unfollow
        @following=Following.where(:user_id => @user, :follower_id=>current_user)
        @following.delete_all
        respond_to do |format|
            format.js
        end
    end
    def following
        @user=User.find_by_username(params[:username])
        @followings=Following.where(:follower_id=>@user.id)
        
    end
    def update_avatar
        @user.avatar_url = params[:avatar_url]
        if @user.save
            respond_to :js
        end
    end

private
    def set_params
        params.pemit(:search_term)
    end
    def set_user
        @user=User.find(params[:user_id])        
    end
end