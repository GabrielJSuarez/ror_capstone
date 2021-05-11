module ProjectHelper

  def total_hours(projects)
    time = projects.pluck(:time)
    time.reduce(0) { |sum, num| sum + num }
  end

  def display_projects(projects)
    projects.each do |project|
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
                    content_tag(:p, project.name, class: 'card-text fw-light') +
                      content_tag(:p, project.time, class: 'card-text)')
                  end +
                    content_tag(:p, nil, class: 'card-text') do
                      content_tag(:small, project.created_at, class: 'text-muted fw-lighter fz-creation mb-1')
                    end
                end
              end
          end
        end
      )
    end
  end

end
