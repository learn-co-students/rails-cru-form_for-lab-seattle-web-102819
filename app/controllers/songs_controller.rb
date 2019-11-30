class SongsController < ApplicationController
    def index 
        @songs = Song.all
    end

    def show
       locate
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        @song.save
        redirect_to @song
    end

    def edit 
        locate
    end

    def update
        locate
        @song.update(song_params)
        redirect_to @song 
    end
    
    private
    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end

    def locate
        @song = Song.find(params[:id])
    end
end
