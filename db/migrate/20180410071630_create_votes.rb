class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :poll, foreign_key: true
      t.string :option_num

      t.timestamps
    end
  end
end
