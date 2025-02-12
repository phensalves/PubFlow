class AddCountryReferenceToBooks < ActiveRecord::Migration[8.0]
  def change
    add_reference :books, :country, null: false, foreign_key: true
  end
end
