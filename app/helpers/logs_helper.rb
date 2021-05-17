# rubocop:disable all

# frozen_string_literal: true

module LogsHelper
  def check_projects
    if @project_options.any?
      render 'shared/log', object: @log
    else
      link_to 'Nothing to add, go back', authenticated_root_path, class: 'nav-link text-center proxima-light'
    end
  end
end
# rubocop:enable all
