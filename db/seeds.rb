
puts 'Creating users...'
newuser = User.create!([
  {first_name: "Mathieu", last_name: "Duprez", email: "math.dups@gmail.com", password: "123456", password_confirmation: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: true}
])

puts 'Creating categories...'
o = Category.create(title: "Weeds")





puts 'Creating products...'
Product.create(title: "ACDC", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "Blue Dream", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "CocoCandy", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "Dieselicious", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "Dwarfhaze", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "Fraise", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "Helvetika", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "Kush", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)
Product.create(title: "NYDIESEL", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1)


