module GroupHelper

  def display_groups(groups)
    groups.each do |group|
      concat(
        content_tag(:div, nil, class: 'card') do
          content_tag(:div, nil, class: 'row g-0 mx-1') do
            content_tag(:div, nil, class: 'col-4') do
              content_tag(:img, nil,
                          src: 'https://robbreport.com/wp-content/uploads/2018/04/gordon-ramsay-1-e1523056498302.jpg?w=1008',
                          class: 'pt-3 project-img')
            end +
              content_tag(:div, nil, class: 'col-8') do
                content_tag(:div, nil, class: 'card-body ms-2 px-1') do
                  content_tag(:div, nil, class: 'd-flex justify-content-between') do
                    content_tag(:p, group.name, class: 'card-text fw-light')
                  end +
                    content_tag(:p, nil, class: 'card-text') do
                      content_tag(:small, group.created_at, class: 'text-muted fw-lighter fz-creation mb-1')
                    end
                end
              end
          end
        end
      )
    end
  end

end
