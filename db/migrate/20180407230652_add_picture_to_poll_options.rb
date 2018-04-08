class AddPictureToPollOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :option1_picture, :string
    add_column :polls, :option2_picture, :string
    add_column :polls, :option3_picture, :string
    add_column :polls, :option4_picture, :string
    add_column :polls, :option5_picture, :string
    add_column :polls, :option6_picture, :string
  end
end
