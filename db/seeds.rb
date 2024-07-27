# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development? and User.find_by(email: 'normal@example.com').nil?
  user = User.new(email: 'normal@example.com',admin: true)
  user.password = "password"
  user.save!
end 
# AdminUser.find_or_create_by(email: 'admin@example.com',admin: true) 
if Rails.env.development? and AdminUser.find_by(email: "admin@email.com").nil?
  user = AdminUser.new(email: 'normal@example.com')
  user.password = "password"
  user.save!
end 



categories = ['Silicon Cover', 'Flip Cover', 'Plastic Cover', 'Custom Cover']


100.times do
  # Generate a fake image URL
  image_url = Faker::LoremFlickr.image(size: "300x300", search_terms: ['product'])

  # Open the image URL
  image_file = URI.open(image_url)

  # Create the product with an attached image
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 10.0..1000.0),
    category: categories.sample,
    on_sale: [true, false].sample,
    new: [true, false].sample,
    image: {
      io: image_file,
      filename: 'product_image.jpg',
      content_type: 'image/jpeg'
    }
  )
end

# db/seeds.rb

# List of provinces to seed
provinces = [
  { name: 'Alberta' },
  { name: 'British Columbia' },
  { name: 'Manitoba' },
  { name: 'New Brunswick' },
  { name: 'Newfoundland and Labrador' },
  { name: 'Nova Scotia' },
  { name: 'Ontario' },
  { name: 'Prince Edward Island' },
  { name: 'Quebec' },
  { name: 'Saskatchewan' }
]

# Create provinces
provinces.each do |province|
  Province.find_or_create_by(province)
end

puts "Provinces have been seeded."
