class AddNicknameToAthleteDetails < ActiveRecord::Migration[8.0]
  def change
    add_column :athlete_details, :nickname, :string
  end
end
