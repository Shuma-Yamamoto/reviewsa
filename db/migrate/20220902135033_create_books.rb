class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :url, null: false

      t.references :subject, foreign_key: true, null: false
      t.timestamps
    end
  end
end
