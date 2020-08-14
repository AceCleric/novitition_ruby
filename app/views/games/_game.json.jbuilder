json.extract! game, :id, :first_team, :second_team, :match_date, :location, :score_first_team, :score_second_team, :created_at, :updated_at
json.url game_url(game, format: :json)
