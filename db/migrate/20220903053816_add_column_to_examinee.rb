# frozen_string_literal: true

class AddColumnToExaminee < ActiveRecord::Migration[7.0]
  def change
    add_column :examinees, :name, :string, null: false
    add_column :examinees, :grade, :integer, null: false

    add_index :examinees, [:name], unique: true
  end
end
