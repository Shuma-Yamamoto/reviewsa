# frozen_string_literal: true

class CreateMockExams < ActiveRecord::Migration[7.0]
  def change
    create_table :mock_exams do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
