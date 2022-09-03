class CreateFavoriteReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_reviews do |t|
      t.references :examinee, foreign_key: true, null: false
      t.references :review, foreign_key: true, null: false
      t.timestamps
    end
  end
end
