module UsersHelper
  def image_for(user)
    if current_user.profile_pic
      image_tag "/user_images/#{current_user.profile_pic}"
    else
      image_tag "logo.png"
    end
  end
end
