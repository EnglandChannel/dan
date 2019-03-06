# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   
  def seed_categories
    phone = ['Apple', 'SamSung', 'XiaoMi', 'LG', 'Nokia', 'Sony', 'BlackBerry']
    laptop = ['Apple', 'Dell', 'Acer', 'Asus', 'Intel', 'HP', 'MSi']
    headphone = ['Apple', 'Sony', 'Sennheiser', 'Beat', 'XiaoMi', 'Sonic', 'Logitech']
  
    phone.each do |name|
      Category.create(branch: 'phone', name: name)
    end
  
    laptop.each do |name|
      Category.create(branch: 'laptop', name: name)
    end
  
    headphone.each do |name|
      Category.create(branch: 'headphone', name: name)
    end
  end
  
  def seed_posts
    categories = Category.all
  
    categories.each do |category|
      5.times do
        Post.create(
          title: Faker::Lorem.sentences[0], 
          imagelink: Faker::Lorem.sentences[0],
          price: Faker::Lorem.sentences[0],
          user_id: rand(1..9), 
          category_id: category.id
        )
      end
    end
  end

  seed_categories
  seed_posts