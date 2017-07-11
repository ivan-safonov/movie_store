class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_or_create_vote

  def upvote
    @vote.create_up
    redirect_to :back
  end

  def downvote
    @vote.create_down
    redirect_to :back
  end

  private

  def find_or_create_vote
    @vote = Vote.find_by( review_id: params[:review_id], user_id: current_user.id )
    @vote = Vote.create( user_id: params[:user_id], review_id: params[:review_id] ) if @vote.blank?
  end
end
