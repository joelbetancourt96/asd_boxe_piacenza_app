class AddAuthenticationFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    change_column_null :users, :email, false unless User.columns_hash["email"]&.null == false
    change_column_null :users, :password_digest, false unless User.columns_hash["password_digest"]&.null == false
  end
end
