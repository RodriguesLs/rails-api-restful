puts "===================================="
puts "Seeds users"

10.times do
  User.create(
    username: Faker::Name.name,
    password: SecureRandom.hex(6)
  )
end
