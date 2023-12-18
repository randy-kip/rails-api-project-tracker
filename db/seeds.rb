# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Milestone.delete_all
Project.delete_all
User.delete_all

u1 = User.create(name: "nitin", email: "n.pol.ku", password: "123")

projects_data = [
  { title: 'Hello world application', created_by: 1, start_date: Date.today, end_date: Date.today + 7.days, created_by: u1.id },
  { title: 'Rails web app', created_by: 1, start_date: Date.today + 2.days, end_date: Date.today + 10.days, created_by: u1.id },
  { title: 'Rails API project', created_by: 1, start_date: Date.today, end_date: Date.today + 5.days, created_by: u1.id }
]

projects = Project.create(projects_data)


m1 = Milestone.create(title: 'Dependencies set up', done: false, project_id: projects[0].id)
m2 = Milestone.create(title: 'Implement feature X', done: true, project_id: projects[1].id)
m3 = Milestone.create(title: 'Write tests', done: false, project_id: projects[2].id)
puts 'Data Seeded.'