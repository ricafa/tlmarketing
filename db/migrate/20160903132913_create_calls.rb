class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.boolean :will_visit
      t.boolean :answer
      t.references :operator, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.datetime :call_time
      t.text :obs

      t.timestamps null: false
    end
  end
end
