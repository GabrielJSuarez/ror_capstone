module ProjectHelper
  def display_projects(projects)
    projects.each do |project|
      concat(
        content_tag(:div, nil, class: 'card mb-3') do
          content_tag(:div, nil, class: 'row g-0 mx-1') do
            content_tag(:div, nil, class: 'col-4') do
              content_tag(:img, nil,
                          src: 'https://robbreport.com/wp-content/uploads/2018/04/gordon-ramsay-1-e1523056498302.jpg?w=1008',
                          class: 'my-3 project-img')
            end +
              content_tag(:div, nil, class: 'col-8') do
                content_tag(:div, nil, class: 'card-body ms-2 px-1') do
                  content_tag(:div, nil, class: 'd-flex justify-content-between') do
                    content_tag(:p, project.name, class: 'card-text') +
                      content_tag(:p, project.time, class: 'card-text)')
                  end +
                    content_tag(:p, nil, class: 'card-text') do
                      content_tag(:small, project.created_at, class: 'text-muted')
                    end
                end
              end
          end
        end
      )
    end
  end
end
