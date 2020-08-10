class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :profession, :string
    add_column :users, :city, :string
    add_column :users, :answer1, :text
    add_column :users, :answer2, :text
    add_column :users, :answer3, :text
  end
end
