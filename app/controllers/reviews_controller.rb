class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def new
    @review = Review.new
  end

  def show

  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@movie, @review] , notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Review was successfully destroyed.' }
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
