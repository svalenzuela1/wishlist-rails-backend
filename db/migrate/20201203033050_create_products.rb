class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.string :category_id

      t.timestamps
    end
  end
end
