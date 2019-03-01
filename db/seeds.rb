# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   
  def seed_categories
    hobby = ['Arts', 'Crafts', 'Sports', 'Sciences', 'Collecting', 'Reading', 'Other']
    study = ['Arts and Humanities', 'Physical Science and Engineering', 'Math and Logic',
            'Computer Science', 'Data Science', 'Economics and Finance', 'Business',
            'Social Sciences', 'Language', 'Other']
    team = ['Study', 'Development', 'Arts and Hobby', 'Other']
  
    hobby.each do |name|
      Category.create(branch: 'hobby', name: name)
    end
  
    study.each do |name|
      Category.create(branch: 'study', name: name)
    end
  
    team.each do |name|
      Category.create(branch: 'team', name: name)
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