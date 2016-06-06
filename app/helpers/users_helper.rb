module UsersHelper
  def image_for(user)
    if current_user.image
      image_tag "/user_images/#{current_user.image}"
    else
      image_tag "logo.png"
    end
  end
end
