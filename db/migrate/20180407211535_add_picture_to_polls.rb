class AddPictureToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :picture, :string
  end
end
