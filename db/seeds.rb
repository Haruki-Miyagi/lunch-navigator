# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


test1_user = User.create(account: 'test1@sample.com')
test2_user = User.create(account: 'test2@sample.com')

Star.create(
    user_id: test1_user.id,
    gnavi_shop_id: 'fbgm600',
)
Star.create(
    user_id: test2_user.id,
    gnavi_shop_id: 'f588302',
)

Review.create(
    user_id: test1_user.id,
    gnavi_shop_id: 'fbgm600',
    score: 3,
    comment: 'あんまり美味しくなかった',
)

Review.create(
    user_id: test2_user.id,
    gnavi_shop_id: 'fbdc600',
    score: 5,
    comment: 'とても美味しかった',
)
