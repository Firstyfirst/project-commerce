class CreateProductCatagory < ActiveRecord::Migration[6.1]
  def change
    create_table :product_catagories do |t|
      t.references :catagory
      t.references :article

      t.timestamps
    end
  end
end
