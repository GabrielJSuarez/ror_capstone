module ApplicationHelper

  def user_name
    return unless signed_in?

    link_to "#{current_user.name.capitalize}'s profile Page", root_path, class: 'nav-link active', aria: { current: 'page'}
  end
  
  def navbar_action_links
    if signed_in?
      content_tag(:li, nil, class: 'nav-item') do
        link_to 'Log Out', destroy_user_session_path, method: :delete, class: 'nav-link'
      end
    else
      content_tag(:li, nil, class: 'nav-item') do
        link_to 'Log in', user_session_path, class: 'nav-link'
      end
    end
  end
end
