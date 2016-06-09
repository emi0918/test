module UsersHelper
  def image_for(user)
    if current_user.profile_pic
      image_tag "/user_images/#{current_user.profile_pic}"

    end
  end
end
