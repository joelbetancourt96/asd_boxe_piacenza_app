class AddWeekdaysToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :monday, :boolean, default: false, null: false
    add_column :courses, :tuesday, :boolean, default: false, null: false
    add_column :courses, :wednesday, :boolean, default: false, null: false
    add_column :courses, :thursday, :boolean, default: false, null: false
    add_column :courses, :friday, :boolean, default: false, null: false
  end
end
