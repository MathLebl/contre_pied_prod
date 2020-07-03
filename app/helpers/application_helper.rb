module ApplicationHelper
  def set_picture(model, size=40)
    if model.image.attached?
      # user.avatar.variant(resize: "#{size}x#{size}!")
      model.image
    else
      image_url("https://images.pexels.com/photos/1191531/pexels-photo-1191531.jpeg?cs=srgb&dl=art-bijoux-bracelet-bracelets-1191531.jpg&fm=jpg")
    end
  end
end
