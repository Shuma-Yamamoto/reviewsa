# frozen_string_literal: true

class CreateCramSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :cram_schools do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
