class GenresController < ApplicationController

    def index 
        @genres = Genre.all
    end

    def show
       locate
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to @genre
    end

    def edit 
        locate
    end

    def update
        locate
        @genre.update(genre_params)
        redirect_to @genre 
    end
    
    private
    def genre_params
        params.require(:genre).permit(:name)
    end

    def locate
        @genre = Genre.find(params[:id])
    end
end
