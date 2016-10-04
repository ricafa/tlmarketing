class AddObsToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :obs, :text
  end
end
