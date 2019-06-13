class CreateProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :projects_users do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :project, index: true, null: false
    end
  end
end
