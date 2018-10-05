
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    # @reviews = Review.where(movie_id: @movie.id)
    @reviews = @movie.reviews
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.img = ImdbService.get_image_by_title(@movie.title)
    @movie.overview = ImdbService.get_overview_by_title(@movie.title)
    @movie.release_date = ImdbService.get_release_date_by_title(@movie.title) 
    if @movie.save
      redirect_to @movie
    else
      render "new"
    end
    # another way:
    # if @movie.valid?
    #   render json: @movie
    # else
    #   render "isnt valid"
    # end
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    if @movie.save
      redirect_to movie_path
    else
      render "new"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :genre, :runtime, :img)
  end
end
