class AddSyncedToPrediction < ActiveRecord::Migration[6.0]
  def change
    # this is going to be used for skipping prediction sync that have been done
    add_column :predictions, :synced, :boolean, default: false
  end
end
