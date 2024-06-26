User.destroy_all
Collection.destroy_all
Item.destroy_all

admin=User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: 'admin',
  blocked: 'active'
)

user1 = User.create!(
  email: 'user1@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: 'user',
  blocked: 'active'
)

user2 = User.create!(
  email: 'user2@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: 'user',
  blocked: 'active'
)

categories = ["Books", "Signs", "Silverware", "Other"]

collection1 = Collection.create!(
  name: 'Books Collection',
  description: 'A collection of various books.',
  category: categories[0],
  user: user1,
)

collection2 = Collection.create!(
  name: 'Signs Collection',
  description: 'A collection of various signs.',
  category: categories[1],
  user: user1,
)

collection3 = Collection.create!(
  name: 'Silverware Collection',
  description: 'A collection of various silverware.',
  category: categories[2],
  user: user2,

)

Item1=Item.create!(
  name: 'The Great Gatsby',
  tags: 'classic, literature',
  collection: collection1,
)
Item2=Item.create!(
  name: 'Spiderman',
  tags: 'fictional',
  collection: collection1,

)
Item3=Item.create!(
  name: 'Stop Sign',
  tags: 'road, safety',
  collection: collection2,

)
Item4=Item.create!(
  name: 'Correct Sign',
  tags: 'write, test',
  collection: collection2,

)
Item5=Item.create!(
  name: 'Antique Spoon',
  tags: 'antique, kitchenware',
  collection: collection3,
)
Item6=Item.create!(
  name: 'Dishes',
  tags: 'kitchenware',
  collection: collection3,
)
Item7=Item.create!(
  name: 'Ladle',
  tags: 'food, soup',
  collection: collection3,
)
