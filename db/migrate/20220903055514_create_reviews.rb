# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :begin_about, null: false
      t.integer :begin_season
      t.integer :begin_month
      t.integer :finish_about, null: false
      t.integer :finish_season
      t.integer :finish_month
      t.float :beginning_score
      t.text :pro, null: false
      t.text :con, null: false
      t.text :recommended_person, null: false
      t.text :recommended_usage, null: false
      t.integer :evaluation, null: false

      t.references :university_student, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.references :mock_exam, foreign_key: true, null: true
      t.timestamps
    end
  end
end
