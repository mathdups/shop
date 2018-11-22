
puts 'Creating users...'
newuser = User.create!([
  {first_name: "Mathieu", last_name: "Duprez", email: "math.dups@gmail.com", password: "123456", password_confirmation: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: true}
])

puts 'Creating categories...'
o = Category.create(title: "Weeds")





puts 'Creating products...'
Product.create(title: "ACDC", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542565677/e22w75phaabyie1cwkwp.png"), category_id: 1)
Product.create(title: "Blue Dream", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568662/jozljnzj7shdf0qxxoc5.jpg"))
Product.create(title: "CocoCandy", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568712/iilrmt4cclv9pzxle4th.jpg"))
Product.create(title: "Dieselicious", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568744/futwjhbsgiesil2pawxh.jpg"))
Product.create(title: "Dwarfhaze", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568763/oibbbagnloa13tp26vi9.jpg"))
Product.create(title: "Fraise", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568778/yrsebzuk9eo5wntyhaad.png"))
Product.create(title: "Helvetika", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568795/djushbdpxxcztagsjpiz.png"))
Product.create(title: "Kush", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568844/hzpaesqnnfm09cyoerpi.png"))
Product.create(title: "NYDIESEL", price: 13.55, short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin varius arcu, quis malesuada dolor.", category_id: 1, photo: open("https://res.cloudinary.com/dkprc38da/image/upload/v1542568857/tqqfcqpewgzg3imijdrm.jpg"))


