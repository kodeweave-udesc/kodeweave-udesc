module TasksHelper
  # created in_progress late finished
  def class_color_task(task)
    return 'bg-info'

    if task.created?
      "bg-info"
    else
      if task.in_progress?
        "bg-warning"
      else
        if task.late?
          "bg-danger"
        else
          "bg-success"
        end
      end
    end
  end
end
