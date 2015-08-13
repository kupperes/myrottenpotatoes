class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find params[:id]
    render json: @movie if request.xhr?
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.create movie_params
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created"
      redirect_to movies_path
    else
      render 'new'
    end
  end
  
  def edit
    @movie = Movie.find params[:id]
  end
  
  def update
    @movie = Movie.find params[:id]
    if @movie.update_attributes movie_params
      flash[:notice] = "#{@movie.title} was successfully updated"
      redirect_to movie_path @movie
    else
      render 'edit'
    end
  end
  
  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Movie #{@movie.title} deleted"
    redirect_to movies_path
  end
  
  def search_tmdb
    @movies = Movie.find_in_tmdb params[:search_terms]
    unless @movies
      flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb"
      redirect_to movies_path
    end
    render :index
  end
  
  private
  
  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :release_date)
  end
end