# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

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
