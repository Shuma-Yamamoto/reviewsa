class CreateCramHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :cram_histories do |t|
      t.date :join_at, null: false
      t.date :leave_at, null: false

      t.references :university_student, foreign_key: true, null: false
      t.references :cram_school, foreign_key: true, null: false
      t.timestamps
    end
  end
end
