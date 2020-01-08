class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :category
      t.string :maincategory
      t.string :suppliername
      t.string :productpicurl
      t.integer :quantity

      t.timestamps
    end
  end
end
