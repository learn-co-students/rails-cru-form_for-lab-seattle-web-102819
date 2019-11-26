class ArtistsController < ApplicationController

    def show
        find_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end

    def update 
        @artist = Artist.find(params[:id])
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def edit
        find_artist
    end

    private

    def find_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end
end
