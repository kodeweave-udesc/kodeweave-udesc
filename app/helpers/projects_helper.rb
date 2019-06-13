module ProjectsHelper
  # created in_progress late finished
  def class_color_project(project)
    if project.created?
      "bg-info"
    else
      if project.in_progress?
        "bg-warning"
      else
        if project.late?
          "bg-danger"
        else
          "bg-success"
        end
      end
    end
  end
end
