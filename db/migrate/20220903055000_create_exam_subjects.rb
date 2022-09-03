class CreateExamSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_subjects do |t|
      t.references :university_student,foreign_key: true, null: false
      t.references :subject, foreign_key: true, null: false
      t.timestamps
    end
  end
end
