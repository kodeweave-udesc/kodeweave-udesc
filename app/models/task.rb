class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, presence: true

  def color
    ''
  end
end
