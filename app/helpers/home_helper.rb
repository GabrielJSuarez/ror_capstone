module HomeHelper
  def profile_picture
    content_tag(:div, nil, class: 'd-flex pt-3 justify-content-center') do
      image_tag current_user.picture.variant(resize_and_pad: [200, 200]), class: 'rounded-circle mx-auto'
    end
  end
end
