class ChangePasswordDigesToPasswordDigest < ActiveRecord::Migration
  def change
    rename_column :users, :password_diges, :password_digest
  end
end
