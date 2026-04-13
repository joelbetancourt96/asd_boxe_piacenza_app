class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :profile_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
