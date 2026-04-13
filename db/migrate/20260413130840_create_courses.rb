class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.time :start_time
      t.time :end_time
      t.text :description

      t.timestamps
    end
  end
end
