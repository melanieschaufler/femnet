class AddMentorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mentor, :boolean
  end
end
