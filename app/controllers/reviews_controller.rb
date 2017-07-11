class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, except: [:show]

  def new
    # if user reviewed it already
    unless (review = Review.find_by(user_id: current_user.id, movie_id: @movie.id)).blank?
      redirect_to user_review_path(current_user.id, review.id), notice: "You've reviewed this movie!"
    end
    @review = Review.new
  end

  def show
    @data = { review: review = Review.find(params[:id]),
              review_score: (ci_lower_bound review.upvotes.count, review.upvotes.count + review.downvotes.count, 0.95),
              comment: Comment.new,
              comments: Comment.where(review_id: review.id) }
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to [current_user, @review] , notice: 'Review was successfully created.' }
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
    params.require(:review).permit(:rating, :comment, :subtitle)
  end
end
