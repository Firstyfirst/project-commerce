class AddColunms < ActiveRecord::Migration[6.1]
  def change
    add_column :catagories, :title, :string
    add_column :catagories, :body, :string
  end
end
