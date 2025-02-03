class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.decimal :price
      t.date :published_at

      t.timestamps
    end
  end
end
