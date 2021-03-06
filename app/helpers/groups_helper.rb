# rubocop:disable all

# frozen_string_literal: true

module GroupsHelper
  def display_groups(groups)
    groups.each do |group|
      concat(
        content_tag(:div, nil, class: 'border-0 border-bottom bg-primary pb-3') do
          content_tag(:div, nil, class: 'row g-0 mx-1') do
            content_tag(:div, nil, class: 'col-4') do
              image_tag group.group_image.variant(resize_and_pad: [120, 90]), class: 'pt-3'
            end +
              content_tag(:div, nil, class: 'col-8') do
                content_tag(:div, nil, class: 'card-body ms-2') do
                  content_tag(:div, nil, class: 'd-flex justify-content-between') do
                    link_to(group_path(group)) do
                      content_tag(:p, group.name, class: 'card-text fs-groups text-white proxima-bold')
                    end
                  end +
                    content_tag(:p, nil, class: 'card-text pt-2') do
                      content_tag(:small,
                                  "Created #{time_ago_in_words(group.created_at)} ago",
                                  class: 'text-white fw-lighter fz-creation proxima-light')
                    end
                end
              end +
              content_tag(:div, nil, class: 'd-flex justify-content-between px-1 pt-2') do
                content_tag(:span, nil) do
                  link_to 'Edit Group', edit_group_path(group), class: 'btn btn-sm btn-outline-warning fs-groups text-white proxima-bold mb-0 text-decoration-none'
                end +
                  content_tag(:span, nil) do
                    link_to 'Delete Group', group_path(group), method: :delete, data: {:confirm => "Delete Group?" }, class: 'btn btn-sm btn-outline-danger fs-groups text-white proxima-bold mb-0 text-decoration-none'
                  end
              end
          end
        end
      )
    end
  end
end
# rubocop:enable all