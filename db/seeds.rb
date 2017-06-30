Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  cost: Faker::Number.between(10, 50),
                  country: Faker::Address.country,
                  description: Faker::Hipster.paragraph(2, false, 3))
end

p "Created #{Product.count} products"

Review.destroy_all

250.times do |index|
  Review.create!(author: Faker::HarryPotter.character,
                content_body: Faker::Hipster.sentence(10, false, 4),
                rating: Faker::Number.between(1, 5),
                product_id: Faker::Number.between(1, 50))
end

p "Created #{Review.count} reviews"
