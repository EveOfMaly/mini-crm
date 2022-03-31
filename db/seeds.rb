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

# Create three pages for user 1 and 2 pages for User two
3.times do 
    Page.create(title: Faker::Commerce.product_name, user: user1, owner: user1.username)  
end

2.times do 
    Page.create(title: Faker::Commerce.product_name, user: user2, owner: user1.username)  
end


#visitors visit the page 
10.times do 
    Visitor.create(name: Faker::FunnyName.name, last_visit: 
end













