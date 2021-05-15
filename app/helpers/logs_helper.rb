module LogsHelper
  def check_projects
    if @project_options.any?
      render 'shared/log', object: @log
    else
      link_to 'Nothing to add, go back', authenticated_root_path, class: 'nav-link text-center'
    end
  end
end
