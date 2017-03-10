class CommentsController < ApplicationController
    before_action :set_movie, :only=>[:create, :edit, :update, :destroy]
    before_action :set_comment, :only=>[:edit, :update, :destroy]

    def create
        @comment=@movie.comments.new(get_params)
        @comment.user=current_user
        @comment.save
        respond_to do |format|
            format.js
        end
    end
    def edit
    end
    def update
        if @comment.update(get_params)
            redirect_to movies_path
        else
            respond_to do |format|
                format.js
            end
        end
    end
    def destroy
        @comment.destroy
        respond_to do |format|
            format.js
        end
    end
    
private
    def get_params
        params.require(:comment).permit(:comment)
    end
    def set_movie
        @movie=Movie.find(params[:movie_id])
    end
    def set_comment
        @comment=@movie.comments.find(params[:id])
    end
end
