module ApplicationHelper
  def link_to_user(user)
    link_to user.name, user
  end
end
