class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :begin_about, null: false
      t.integer :begin_season, null: false
      t.integer :begin_month, null: false
      t.integer :finish_about, null: false
      t.integer :finish_season, null: false
      t.integer :finish_month, null: false
      t.float :beginning_score, null: false
      t.text :pro, null: false
      t.text :con, null: false
      t.text :recommended_person, null: false
      t.text :recommended_usage, null: false
      t.integer :evaluation, null: false

      t.references :university_student, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.references :mock_exam, foreign_key: true, null: false
      t.timestamps
    end
  end
end
