class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    create_table :recommendations do |t|
      t.references :book, null: false, foreign_key: true
      t.decimal :score
      t.datetime :generated_at

      t.timestamps
    end
  end
end
