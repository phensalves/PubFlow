class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :sku, null: false
      t.date :published_at
      t.references :author, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end

    # Add unique index for sku
    add_index :books, :sku, unique: true
  end
end
