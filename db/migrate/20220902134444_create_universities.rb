class CreateUniversities < ActiveRecord::Migration[7.0]
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :faculty, null: false
      t.string :department
      t.float :score, null: false
      t.string :email, null: false
      t.text :url, null: false

      t.timestamps
    end
  end
end
