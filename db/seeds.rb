require 'faker'

75.times do
  user = User.create(email: Faker::Internet.email,
                    password: "password",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.unique.last_name,
                    street_address: Faker::Address.street_address,
                    city: Faker::Address.city,
                    zip_code: Faker::Address.zip_code,
                    role: 0)
  puts "Created user #{user.id}"
end

@author_1 = Author.create(name: "Author 1",
                          bio: Faker::Lorem.paragraph,
                          user_id: 1)
puts "Author created: author 1"

@author_2 = Author.create(name: "Author 2",
                         bio: Faker::Lorem.paragraph,
                         user_id: 2)
puts "Author created: author 2"

@author_3 = Author.create(name: "Author 3",
                          bio: Faker::Lorem.paragraph,
                          user_id: 3)
puts "Author created: author 3"

@author_4 = Author.create(name: "Author 4",
                         bio: Faker::Lorem.paragraph,
                         user_id: 4)
puts "Author created: author 4"

User.create(email: "admin@admin.com",
            password: "admin",
            first_name: "John",
            last_name: "Doe",
            street_address: "123 Some Place",
            city: "Denver",
            zip_code: "80201",
            role: 1)
puts "Created admin account"

@fantasy = Category.create(name: 'Fantasy')
puts "Category added: fantasy"
@thriller = Category.create(name: 'Thriller')
puts "Category added: thriller"
@sci_fi = Category.create(name: 'Science Fiction')
puts "Category added: scifi"
@satire = Category.create(name: 'Satire')
puts "Category added: satire"
@drama = Category.create(name: 'Drama')
puts "Category added: drama"
@action = Category.create(name: 'Action')
puts "Category added: action"
@adventure = Category.create(name: 'Adventure')
puts "Category added: adventure"
@romance = Category.create(name: 'Romance')
puts "Category added: romance"
@mystery = Category.create(name: 'Mystery')
puts "Category added: mystery"
@horror = Category.create(name: 'Horror')
puts "Category added: horror"
@self_help = Category.create(name: 'Self Help')
puts "Category added: self help"
@childrens = Category.create(name: 'Childrens')
puts "Category added: childrens"
@science = Category.create(name: 'Science')
puts "Category added: science"
@history = Category.create(name: 'History')
puts "Category added: history"
@poetry = Category.create(name: 'Poetry')
puts "Category added: poetry"
@graphic_novel = Category.create(name: 'Graphic Novel')
puts "Category added: graphic novel"
@cookbook = Category.create(name: 'Cookbook')
puts "Category added: cookbook"
@biography = Category.create(name: 'Biography')
puts "Category added: biography"
@autobiography = Category.create(name: 'Autobiography')
puts "Category added: autobiography"
@short_story = Category.create(name: 'Short Story')
puts "Category added: short story"

25.times do
  ebook = Ebook.create(title: Faker::Book.title,
                       description: Faker::Lorem.paragraph,
                       body: Faker::Lorem.paragraph(100, true),
                       price: 2.00,
                       published: false,
                       author: @author_1)
  ebook.categories << @fantasy
  puts "Fantasy books have been added"
end

25.times do
  ebook = Ebook.create(title: Faker::Book.title,
                       description: Faker::Lorem.paragraph,
                       body: Faker::Lorem.paragraph(100, true),
                       price: 2.00,
                       published: false,
                       author: @author_1)
  puts "Satire books have been added"
end

25.times do
  @drama.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_1)
                          puts "Drama books have been added"
end

25.times do
  @action.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_1)
                          puts "Action books have been added"
end

25.times do
  @adventure.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_1)
                          puts "Adventure books have been added"
end

25.times do
  @thriller.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_2)
                          puts "Thriller books have been added"
end

25.times do
  @mystery.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_2)
                          puts "Mystery books have been added"
end

25.times do
  @horror.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_2)
                          puts "Horror books have been added"
end

25.times do
  @self_help.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_2)
                          puts "Self Help books have been added"
end

25.times do
  @childrens.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_2)
                          puts "Childrens books have been added"
end

25.times do
  @sci_fi.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_3)
                          puts "SciFi books have been added"
end

25.times do
  @science.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_3)
                          puts "Science books have been added"
end

25.times do
  @history.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_3)
                          puts "History books have been added"
end

25.times do
  @poetry.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_3)
                          puts "Poetry books have been added"
end

25.times do
  @graphic_novel.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_3)
                          puts "Graphic Novel books have been added"
end

25.times do
  @romance.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_4)
                          puts "Romance books have been added"
end

25.times do
  @cookbook.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_4)
                          puts "Cookbook books have been added"
end

25.times do
  @biography.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_4)
                          puts "Biography books have been added"
end

25.times do
  @autobiography.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_4)
                          puts "Autobiography books have been added"
end

25.times do
  @short_story.ebooks.create(title: Faker::Book.title,
                          description: Faker::Lorem.paragraph,
                          body: Faker::Lorem.paragraph(100, true),
                          price: 2.00,
                          published: false,
                          author: @author_4)
                          puts "Short Story books have been added"
end

300.times do
  t1 = Time.parse("2017-04-16 12:00:00")
	t2 = Time.parse("2017-09-15 12:00:00")
  order = Order.create(user_id: rand(1..75),
                       total_price: rand(1..20),
                       status: rand(0..3),
                       created_at: rand(t1..t2))
  puts "Created order #{order.id}"
end

301.times do |i|
  while i == 0 do
    puts "Skipping 0 index"
    i += 1
  end
  order = Order.find(i)
  rand(1..4).times do
    ebook = Ebook.find(rand(1..200))
    order.ebooks << ebook
    puts "Added a book"
  end
  puts "Updated order #{i}"
  i += 1
end
