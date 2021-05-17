# rubocop:disable all

# frozen_string_literal: true

module ApplicationHelper
  def user_name
    return unless signed_in?

    link_to "#{current_user.name.capitalize}'s profile Page", authenticated_root_path, class: 'nav-link proxima-bold', aria: { current: 'page' }
  end

  def navbar_action_links
    if signed_in?
      content_tag(:li, nil, class: 'nav-item') do
        link_to 'Log Out', destroy_user_session_path, method: :delete, class: 'nav-link proxima-light'
      end
    else
      content_tag(:li, nil, class: 'nav-item') do
        link_to 'Log in', user_session_path, class: 'nav-link proxima-light'
      end
    end
  end

  def flash_messages(name, msg)
    case name
    when 'alert'
      alert('danger', msg)
    when 'notice'
      alert('success', msg)
    else
      alert(name, msg)
    end
  end

  def navbar_dropdown
    if user_signed_in?
      content_tag(:li, nil, class: 'dropdown-item proxima-bold') do
        link_to 'Projects', projects_path, class: 'dropdown-item proxima-bold'
      end +
        content_tag(:li, nil, class: 'dropdown-item proxima-bold') do
          link_to 'External Projects', external_path, class: 'dropdown-item proxima-bold'
        end +
        content_tag(:li, nil, class: 'dropdown-item proxima-bold') do
          link_to 'Groups', groups_path, class: 'dropdown-item proxima-bold'
        end +
        content_tag(:li, nil) do
          content_tag(:hr, nil, class: 'dropdown-divider')
        end +
        content_tag(:li, nil, class: 'dropdown-item proxima-bold') do
          link_to 'Create New Project', new_project_path, class: 'dropdown-item proxima-bold'
        end +
        content_tag(:li, nil, class: 'dropdown-item proxima-bold') do
          link_to 'Create New Group', new_group_path, class: 'dropdown-item proxima-bold'
        end
    else
      content_tag(:li, nil, class: 'dropdown-item proxima-bold') do
        link_to 'Log in', new_user_session_path, class: 'dropdown-item proxima-bold'
      end +
        content_tag(:li, nil, class: 'dropdown-item proxima-bold') do
          link_to 'Sign in', new_user_registration_path, class: 'dropdown-item proxima-bold'
        end
    end
  end

  private

  def alert(name, msg)
    content_tag(:div, msg, class: "alert alert-#{name} mb-0 proxima-light", role: 'alert')
  end
end
# rubocop:enable all
