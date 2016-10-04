class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
