namespace :sync_predictions_task do
  desc "Sync predictions and returns points if needed"
  task :fetch => :development do
    puts "Syncing predictions"
    SyncPredictionsJob.new.sync
    puts "#{Time.zone.now} - Success!"
  end
end
