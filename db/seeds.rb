# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: "Mahmoud")
group1 = Group.create(name: "Food", author_id: user1.id)
operation1 = Operation.create(name: "lunch", amount: 30, author_id: user1.id)
GroupOperation.create(group_id: group1.id, operation_id: operation1.id)
