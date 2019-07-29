class AddAvatarToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :avatar, null: false, default: ""
    end
  end
end
