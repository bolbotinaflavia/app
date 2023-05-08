# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
    name: "John",
    email: "asdasd@adsa.com",
    age: 22,
    gender: "Male",
    phone_number:"0734567890"
)

User.create(
    name: "Alexandra",
    email: "alexandra@adsa.com",
    age: 25,
    gender: "Female",
    phone_number:"0734567456"
)

User.create(
    name: "Mike",
    email: "Mike@adsa.com",
    age: 18,
    gender: "Male",
    phone_number:"0724567870"
)

User.create(
    name: "Ioana",
    email: "Ioana@adsa.com",
    age: 19,
    gender: "Female",
    phone_number:"0734563456"
)

User.create!(
    name: "Andrei",
    email: "Andrei@adsa.com",
    age: 17,
    gender: "Other",
    phone_number:"0734567890"
)