class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, default: ""
      t.datetime :end_at
      t.integer :status, null: false, default: 0

      t.belongs_to :project, index: true, null: false

      t.timestamps
    end
  end
end
