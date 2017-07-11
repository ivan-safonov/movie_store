module UsersHelper

  def get_user id
    User.find id
  end

  def get_user_score
    Comment.where(user_id: current_user.id).count
  end

end
