class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :string
    add_column :users, :introduction, :string
  end
end
