class Vote < ApplicationRecord
  belongs_to :review
  belongs_to :user
  has_one :upvote
  has_one :downvote

  def create_up
    if upvote.blank?
      downvote.destroy unless downvote.blank?
      Upvote.create(vote_id: id)
    else
      upvote.destroy unless upvote.blank?
    end
  end

  def create_down
    if downvote.blank?
      upvote.destroy unless upvote.blank?
      Downvote.create(vote_id: id)
    else #
      downvote.destroy unless downvote.blank?
    end
  end

end
