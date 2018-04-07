class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5
      t.string :option6
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :polls, [:user_id, :created_at]
  end
end
