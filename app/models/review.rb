class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :votes
  has_many :upvotes, through: :votes
  has_many :downvotes, through: :votes

  validates :movie_id, uniqueness: { scope: :user_id, message: "You've reviewed this movie!" }
  validates_presence_of :comment, :rating, :subtitle


  def self.get_data movie
    # get reviews average movie rating in review
    if (reviews = Review.where(movie_id: movie.id).order "created_at DESC").blank?
      avg_review = 0
    else
      avg_review = reviews.average(:rating).round(2)
    end

    # get sorted reviews
    sorted_reviews_arr = []

    reviews.each do |review|
      hash_with_review = {}
      hash_with_review[:review] = review
      hash_with_review[:score] = (
        ci_lower_bound review.upvotes.count, review.upvotes.count + review.downvotes.count, 0.95
      )
      sorted_reviews_arr << hash_with_review
    end

    data = {
        reviews:   sorted_reviews_arr.sort_by! { |hash| hash[:score] }.reverse,
        avg_review: avg_review
    }
  end
end


def ci_lower_bound(pos, n, confidence)
  if n == 0
    return 0
  end
  z = Statistics2.pnormaldist(1-(1-confidence)/2)
  phat = 1.0*pos/n
  (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
end

