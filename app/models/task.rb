class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum status: %i[created in_progress late done]

  validates :name, presence: true

  def color
    ''
  end
end
