# frozen_string_literal: true

class CreateFixBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :fix_books do |t|
      t.text :detail, null: false

      t.references :university_student, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.timestamps
    end
  end
end
