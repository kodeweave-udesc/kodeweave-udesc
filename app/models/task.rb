class Task < ApplicationRecord
  belongs_to :project

  enum status: %i[created in_progress late finished]

  validates :name, presence: true

  def status_name
    return "Criado" if status == "created"
    return "Em Progresso" if status == "in_progress"
    return "Atrasado" if status == "late"
    return "Finalizado" if status == "finished"
    status
  end
end
