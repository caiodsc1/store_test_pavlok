class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.float :total
      t.boolean :success

      t.timestamps
    end
  end
end
