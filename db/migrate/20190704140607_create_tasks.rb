class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, default: ""
      t.date :goals_end_at
      t.date :goals_start_at
      t.date :real_end_at
      t.date :real_start_at
      t.integer :status, null: false, default: 0
      t.string :obs, null: false, default: ""
      t.string :full_detailing, null: false, default: ""
      t.string :short_detailing, null: false, default: ""

      t.belongs_to :project, index: true, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
