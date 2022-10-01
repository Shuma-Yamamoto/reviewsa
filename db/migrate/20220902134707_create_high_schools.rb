# frozen_string_literal: true

class CreateHighSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :high_schools do |t|
      t.string :name, null: false
      t.float :score

      t.references :prefecture, foreign_key: true, null: false
      t.timestamps
    end
  end
end
