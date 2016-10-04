class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :contact, index: true, foreign_key: true
      t.references :operator, index: true, foreign_key: true
      t.string :clerk
      t.datetime :date_must_come
      t.datetime :date_came
      t.boolean :signed_contract

      t.timestamps null: false
    end
  end
end
