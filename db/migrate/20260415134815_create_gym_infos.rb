class CreateGymInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :gym_infos do |t|
      t.string :gym_name, limit: 100
      t.string :gym_address
      t.string :gym_subaddress
      t.string :zip_code, limit: 10
      t.string :city, limit: 50
      t.string :registered_office_address
      t.string :phone
      t.string :mobile_phone
      t.string :info_email
      t.string :vat_number, limit: 11
      t.string :fiscal_code, limit: 16

      t.timestamps
    end
  end
end
