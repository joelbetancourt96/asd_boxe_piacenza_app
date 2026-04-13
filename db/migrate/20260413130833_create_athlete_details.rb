class CreateAthleteDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :athlete_details do |t|
      t.string :fpi_card_id
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.decimal :weight
      t.string :category
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
