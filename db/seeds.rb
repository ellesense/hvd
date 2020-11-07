# Some console commands:
# Updating all existing posts
# Post.update_all(:locations => ["Surrey", "Langley"])

Category.create(name: 'Eat & Drink')
Category.create(name: 'Coffee & Tea')
Category.create(name: 'Other Activities')
Category.create(name: 'Sports')
Category.create(name: 'All')
Category.create(name: 'Anonymous Talks')
Category.create(name: 'Teach & Learn')
Category.create(name: 'Online Games')
Category.create(name: 'Gigs & Events')

10.times do |i|
    User.create(
        email: Faker::Internet.email, 
        password: '1234567',
        nickname: Faker::Name.name
    )
end

100.times do |i|
    Post.create(
        title: Faker::Games::WorldOfWarcraft.quote, 
        description: Faker::Lorem.paragraph(sentence_count: 4), 
        user_id: rand(1..10),
        category_id: rand(1..8)
    )
end