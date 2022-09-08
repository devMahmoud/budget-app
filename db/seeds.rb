# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: "Mahmoud")
user2 = User.create(name: "Sam")

group1 = Group.create(name: "Food", author_id: user1.id)
group2 = Group.create(name: "Shopping", author_id: user1.id)
group3 = Group.create(name: "Transportation", author_id: user2.id)

operation1 = Operation.create(name: "lunch", amount: 30, author_id: user1.id)
operation2 = Operation.create(name: "ice cream", amount: 5, author_id: user1.id)
operation3 = Operation.create(name: "new laptop", amount: 300, author_id: user1.id)
operation4 = Operation.create(name: "Train ticket", amount: 19, author_id: user2.id)

GroupOperation.create(group_id: group1.id, operation_id: operation1.id)
GroupOperation.create(group_id: group1.id, operation_id: operation2.id)
GroupOperation.create(group_id: group2.id, operation_id: operation3.id)
GroupOperation.create(group_id: group3.id, operation_id: operation4.id)
