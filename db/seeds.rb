# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Milestone.delete_all
Project.delete_all

u1 = User.create!(name: "nitin", email: "n.pol.ku", password: "123")
projects = Project.create!([{title: 'Hello world application', created_by: 'Nitin'},  {title: 'Rails web app', created_by: 'Nitin'}, {title: 'Rails API project', created_by: 'Nitin'}])

projects.each do |project|
    Milestone.create!(title: 'Set up dependencies',  done: false, project: project)
end


puts 'Data Seeded.'