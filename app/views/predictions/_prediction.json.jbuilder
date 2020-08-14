json.extract! prediction, :id, :team_id, :will_win, :user_id, :points, :created_at, :updated_at
json.url prediction_url(prediction, format: :json)
