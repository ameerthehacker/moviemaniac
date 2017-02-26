class MoviesController < ApplicationController
    before_action :set_movie, :only=>[:edit, :update]

    def new
        @movie=Movie.new
    end
    def edit
    end
    def update
        if @movie.update(get_params)
            redirect_to root_path
        else
            render :edit
        end
    end

private
    def set_movie
        @movie=Movie.find(params[:id])        
    end
    def get_params
        params.require(:movie).permit(:title, :concept, :youtube_link, :casts_attributes=>[:id, :role, :actor, :as, :_destroy], :teams_attributes=>[:id, :role, :members, :_destroy])
    end
end
