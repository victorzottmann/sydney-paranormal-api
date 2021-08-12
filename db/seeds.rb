# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
 user1 = User.create(
   username: "victor",
   email: "victor@gmail.com",
   password: "000000",
   password_confirmation: "000000"
 ),

 user2 = User.create(
   username: "aidan",
   email: "aidan@gmail.com",
   password: "000000",
   password_confirmation: "000000"
 ),

 user3 = User.create(
   username: "nick",
   email: "nick@gmail.com",
   password: "000000",
   password_confirmation: "000000"
 )
end

if Pin.count == 0
  pins = Pin.create([
    {
      title: "David Habour's Female Doppelganger",
      description: "There's been a rumour that a hideous female version of the actor David Habour is haunting civilians near the water. Beware!",
      street: "14 Darling Dr",
      suburb: "Sydney",
      state: "NSW",
      country: "Australia",
      user_id: 1
    },
    {
      title: "The Phantom of the Opera",
      description: "A bunch of former opera singers have turned into haunted phantoms!",
      street: "1 Conservatorium Rd",
      suburb: "Sydney",
      state: "NSW",
      country: "Australia",
      user_id: 2
    },
    {
      title: "The Garden Ghost",
      description: "A strange ghost is haunting civilians at the botanic gardens!",
      street: "Fleet Steps Rd",
      suburb: "Sydney",
      state: "NSW",
      country: "Australia",
      user_id: 3
    }
  ])
end
