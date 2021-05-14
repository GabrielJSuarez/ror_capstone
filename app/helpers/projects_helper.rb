module ProjectsHelper

  def total_hours(projects)
    return unless projects.any?

    content_tag(:div, nil, class: 'd-flex justify-content-between mx-2 py-3 align-items-center') do
      content_tag(:p, 'Total Hours', class: 'mb-0 fw-light') +
        content_tag(:span, projects.pluck(:time).reduce(:+))
    end
  end

  def display_projects(projects)
    return unless projects.any?

    projects.each do |project|
      render_item(project)
    end
  end

  def display_group_projects(projects)
    projects.each do |project|
      render_for_group(project)
    end
  end

  private

  def render_item(project)
    concat(
      content_tag(:div, nil, class: 'card') do
        content_tag(:div, nil, class: 'row g-0 mx-1') do
          content_tag(:div, nil, class: 'col-4') do
            content_tag(:img, nil,
                        src: 'https://robbreport.com/wp-content/uploads/2018/04/gordon-ramsay-1-e1523056498302.jpg?w=1008',
                        class: 'pt-3 projects-img')
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

  def render_for_group(project)
    concat(
      content_tag(:div, nil, class: 'card') do
        content_tag(:div, nil, class: 'row g-0 mx-1') do
          content_tag(:div, nil, class: 'col-4') do
            content_tag(:img, nil,
                        src: 'https://robbreport.com/wp-content/uploads/2018/04/gordon-ramsay-1-e1523056498302.jpg?w=1008',
                        class: 'pt-3 projects-img')
          end +
            content_tag(:div, nil, class: 'col-8') do
              content_tag(:div, nil, class: 'card-body ms-2 px-1') do
                content_tag(:div, nil, class: 'text-end') do
                  content_tag(:p, project.name, class: 'card-text fw-light')
                end +
                  content_tag(:p, nil, class: 'card-text text-end') do
                    content_tag(:small, project.created_at, class: 'text-muted fw-lighter fz-creation mb-1')
                  end
              end
            end
        end +
          content_tag(:p, "Author: #{User.find(project.author_id).name}",
                      class: 'card-text mb-1 text-muted fw-light pe-2 text-start')
      end
    )
  end
end
