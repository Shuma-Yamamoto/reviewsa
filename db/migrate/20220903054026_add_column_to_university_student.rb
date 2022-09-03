class AddColumnToUniversityStudent < ActiveRecord::Migration[7.0]
  def change

    add_column :university_students, :name, :string, null: false
    add_column :university_students, :entrance_at, :integer, null: false
    add_column :university_students, :ronin, :integer, null: false
    add_column :university_students, :anonymous_high_school, :boolean, null: false
    add_column :university_students, :join_club_at, :date
    add_column :university_students, :leave_club_at, :date
    add_column :university_students, :club_frequency, :integer

    add_reference :university_students, :university, foreign_key: true, null: false
    add_reference :university_students, :high_school, foreign_key: true, null: false

  end
end
