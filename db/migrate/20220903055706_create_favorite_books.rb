class CreateFavoriteBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_books do |t|
      t.references :examinee, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.timestamps
    end
  end
end
