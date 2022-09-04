# frozen_string_literal: true

class CreateUniversities < ActiveRecord::Migration[7.0]
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :faculty, null: false
      t.string :department
      t.string :domain, null: false
      t.text :url, null: false

      t.timestamps
    end
  end
end
