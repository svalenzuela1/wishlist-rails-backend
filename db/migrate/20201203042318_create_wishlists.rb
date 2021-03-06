class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :product
      t.string :references

      t.timestamps
    end
  end
end
