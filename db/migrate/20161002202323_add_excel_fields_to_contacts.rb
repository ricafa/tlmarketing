class AddExcelFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :phonenumber3, :string
    add_column :contacts, :campaign, :string
    add_column :contacts, :school, :string
    add_column :contacts, :email, :string
  end
end
