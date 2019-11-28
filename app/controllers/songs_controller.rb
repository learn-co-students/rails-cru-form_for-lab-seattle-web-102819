class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.new(song_params)
        @song.save
        redirect_to song_path(@song)
    end

    def update
        @song = Song.find(params[:id])
        Song.update(song_params)
        redirect_to song_path(@song)
    end

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
