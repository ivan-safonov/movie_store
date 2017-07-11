module VotesHelper

  def get_vote rev_id
    parameters = { user_id: current_user.id, review_id: rev_id }
    vote = Vote.find_by( parameters )
    vote = Vote.create( parameters ) if vote.blank?
  end

end
