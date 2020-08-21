
set :environment, "development"
set :output, "log/whenever.log"

every 1.day, :at => "12:00 am" do
  rake "sync_predictions_task:fetch"
end

