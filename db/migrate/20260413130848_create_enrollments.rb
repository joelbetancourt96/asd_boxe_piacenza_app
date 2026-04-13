class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :profile, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
