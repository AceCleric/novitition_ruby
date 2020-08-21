
user = User.create(first_name: "test", last_name: "person", email: "testperson1@email.com", password: "test", password_confirmation: "test")
Wallet.create(credit: 20, user_id: user.id)

Sport.create(name: "Soccer", description: "Soccer a sport played by teams of 11 persons")
Sport.create(name: "Basketball", description: "Basketball a sport played by teams of 11 persons")
Sport.create(name: "American Footbal", description: "Footbal a sport played by teams of 11 persons")
Sport.create(name: "Hockey", description: "Hockey a sport played by teams of 11 persons")

Competition.create(name: "La Liga", nationality: "Spain", sport_id: Sport.find_by(name: "Soccer").id)
Competition.create(name: "Champions league", nationality: "All", sport_id: Sport.find_by(name: "Soccer").id)
Competition.create(name: "NBA tryouts", nationality: "USA", sport_id: Sport.find_by(name: "Basketball").id)
Competition.create(name: "World cup", nationality: "All", sport_id: Sport.find_by(name: "Soccer").id)


Team.create(name: "Lakers", country: "Usa", competition_id: Competition.find_by(name: "NBA tryouts").id)
Team.create(name: "Juventus", country: "Italy", competition_id: Competition.find_by(name: "Champions league").id)
Team.create(name: "Bayern Munchen", country: "Germany", competition_id: Competition.find_by(name: "Champions league").id)
Team.create(name: "Miami Heat", country: "Usa", competition_id: Competition.find_by(name: "NBA tryouts").id)

Game.create(
  first_team_id: Team.find_by(name: "Lakers").id, 
  second_team_id: Team.find_by(name: "Miami Heat").id,
  match_date: Time.zone.now,
  score_first_team: 2,
  score_second_team: 3,
  prediction_prize: 1,
  competition_id: Competition.find_by(name: "NBA tryouts").id,
  location: "Amsterdam"
)

game = Game.create(
  first_team_id: Team.find_by(name: "Juventus").id, 
  second_team_id: Team.find_by(name: "Miami Heat").id,
  match_date: Time.zone.now + 1.days,
  score_first_team: 0,
  score_second_team: 0,
  prediction_prize: 1,
  competition_id: Competition.find_by(name: "NBA tryouts").id,
  location: "Amsterdam"
)

Prediction.create(
  team_id: Team.find_by(name: "Juventus").id,
  will_win: true,
  user_id: user.id,
  points: 2,
  game_id: game.id,
  synced: false
)
