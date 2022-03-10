# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Team.delete_all

team1 = Team.create!(
  name: 'Flamingo',
  id:1
)

team2 = Team.create!(
  name: 'Fosters',
  id:2
)

Project.delete_all

project1 = Project.create!(
  name: 'Apple',
  id:1
)

project2 = Project.create!(
  name: 'Helix',
  id:2
)

Member.delete_all

member1  = Member.create!(
  first_name: 'John',
  last_name: 'Doe',
  city: 'Gater',
  state: 'Oh!',
  country: 'Cfusion',
  team_id: team1.id,
  project_id: project1.id,
  id: 1
)

member2  = Member.create!(
  first_name: 'Pie',
  last_name: 'Maker',
  city: 'Gater',
  state: 'Oh!',
  country: 'Cfusion',
  team_id: team2.id,
  project_id: project2.id,
  id: 2
)
