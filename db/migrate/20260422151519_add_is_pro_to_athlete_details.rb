class AddIsProToAthleteDetails < ActiveRecord::Migration[8.0]
  def change
    add_column :athlete_details, :is_pro, :boolean, default: false, null: false
  end
end
