unless User.exists?(email: "admin@focostartups.com")
  User.create!(email: "admin@focostartups.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@focostartups.com")
  User.create!(email: "viewer@focostartups.com", password: "password")
end