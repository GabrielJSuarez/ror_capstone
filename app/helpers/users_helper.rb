module UsersHelper
  def show_users(users)
    users.each do |user|
      concat(
        content_tag(:div, nil, class: 'border-0 border-bottom bg-primary pb-3') do
          content_tag(:div, nil, class: 'row g-0 mx-1') do
            content_tag(:div, nil, class: 'col-4') do
              image_tag user.picture.variant(resize_and_pad: [100, 100]), class: 'pt-3 rounded-circle mx-auto'
            end +
              content_tag(:div, nil, class: 'col-8') do
                content_tag(:div, nil, class: 'card-body ms-2') do
                  content_tag(:div, nil, class: 'd-flex justify-content-between') do
                    link_to(user_path(user)) do
                      content_tag(:p, user.name, class: 'card-text fs-groups text-white proxima-bold')
                    end
                  end +
                    content_tag(:p, nil, class: 'card-text pt-2') do
                      content_tag(:small,
                                  "User since: #{time_ago_in_words(user.created_at)} ago",
                                  class: 'text-white fw-lighter fz-creation proxima-light')
                    end
                end
              end
          end
        end
      )
    end
  end
end
