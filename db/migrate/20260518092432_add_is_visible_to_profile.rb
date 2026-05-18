class AddIsVisibleToProfile < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :isVisible, :boolean, default: true, null: false
  end
end
