class AddSkuToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :sku, :string
    add_index :books, :sku, unique: true
  end
end
