# Some console commands:
# Updating all existing posts
# Post.update_all(:locations => ["Surrey", "Langley"])

# 식사 & 음주
Category.create(name: 'Eat & Drink')

# 커피 & 티
Category.create(name: 'Coffee & Tea')

# 기타 액티비티
Category.create(name: 'Other Activities')

# 스포츠
Category.create(name: 'Sports')

# 모든 글
Category.create(name: 'All')

# 익명 온라인 대화
Category.create(name: 'Anonymous Talks')

# 공부 모임
Category.create(name: 'Teach & Learn')

# 온라인 게임
Category.create(name: 'Online Games')

# 이벤트 
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