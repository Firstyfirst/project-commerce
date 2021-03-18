class CreateArticle < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.timestamps
    end

    
    change_table :articles do |t|
      t.string :title
      t.string :body
      t.integer :stock
      t.integer :price
      t.timestamps
    end
  end
end
