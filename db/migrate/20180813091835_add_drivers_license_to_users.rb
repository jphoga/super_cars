class AddDriversLicenseToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :drivers_license, :string
  end
end
