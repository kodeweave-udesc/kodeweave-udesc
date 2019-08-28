module Projects::TasksHelper
  def taks_row_class(task)
    if task.created?
      return 'bg-warning text-light'
    elsif task.in_progress?
      return 'bg-info text-light'
    elsif task.late?
      return 'bg-danger text-light'
    end

    'bg-success text-light'
  end
end
