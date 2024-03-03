class RoomDecorator < Draper::Decorator
  delegate_all

  def display_name
    if private?
      user_ids = name.split('_')
      users = User.where(id: user_ids)
      usernames = users.map(&:username)
      "Private room users #{usernames.join(' and ')}"
    else
      name
    end
  end
end
