# db/seeds.rb

# Create a default admin user
User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: 'admin',
  blocked: 'active'
)

# You can also create some regular users for testing
User.create!(
  email: 'user1@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: 'user',
  blocked: 'active'
)

User.create!(
  email: 'user2@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: 'user',
  blocked: 'active'
)
