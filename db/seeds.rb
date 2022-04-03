# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#Create two users 
user1 = User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "test" )
user2 = User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "test" )

#create 2 contacts for user1 and 2 for user2
2.times do 
    Contact.create(name: Faker::Name.name, spent: 1000, age: 10, gender: "male", email: Faker::Internet.email, app_id: App.first.id, user_id: user1.id)
end

2.times do 
    Contact.create(name: Faker::Name.name, spent: 1000, age: 10, gender: "female", email: Faker::Internet.email, app_id: App.last.id, user_id: user2.id)
end

#visitors visit the page 
10.times do 
    Visitor.create(name: Faker::FunnyName.name, app_id: App.first.id ,contact_id: Contact.first.id)
end





# Create three pages for user 1 and 2 pages for User two
3.times do 
    Page.create(title: Faker::Commerce.product_name, user: user1, owner: user1.username)  
end

2.times do 
    Page.create(title: Faker::Commerce.product_name, user: user2, owner: user2.username)  
end















