class UsersController < ApplicationController
    def show 
        @user=User.find_by_username(params[:username])
    end
    def search
        @users=User.where('(users.username LIKE ? OR users.email LIKE ?) AND users.username <> ?', "#{params[:search_term]}%", "#{params[:search_term]}%", current_user.username)
    end
    def follow
        @user=User.find(params[:user_id])
        @user.followers<<current_user
        respond_to do |format|
            format.js
        end
    end
    def unfollow
        @user=User.find(params[:user_id])
        @follower=@user.followers.delete(current_user.id)
        respond_to do |format|
            format.js
        end
    end
private
    def set_params
        params.pemit(:search_term)
    end
end