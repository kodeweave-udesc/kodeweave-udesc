class Project < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :owner, foreign_key: "user_id", class_name: "User"

  has_many :tasks

  enum status: %i[created in_progress late finished]

  validates :name, presence: true
end
