class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
