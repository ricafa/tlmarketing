class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :parents
      t.string :phonenumber1
      t.string :phonenumber2

      t.timestamps null: false
    end
  end
end
