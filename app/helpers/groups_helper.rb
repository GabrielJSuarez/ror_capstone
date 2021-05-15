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
                  content_tag(:div, nil, class: 'd-flex justify-content-betw  een') do
                    link_to(group_path(group)) do
                      content_tag(:p, group.name, class: 'card-text fs-groups text-white')
                    end
                  end +
                    content_tag(:p, nil, class: 'card-text') do
                      content_tag(:small, group.created_at, class: 'text-white fw-lighter fz-creation mb-1')
                    end
                end
              end
          end
        end
      )
    end
  end

end
