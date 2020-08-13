class AddScoreToUserInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :user_interests, :score, :integer
  end
end
