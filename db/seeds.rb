# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do
  Author.create(name: Faker::Book.author)
end

100.times do
  Publisher.create(name: Faker::Book.author)
end

100.times do
  Genre.create(name: Faker::Book.genre)
end


100.times do
  [].tap do |array|
    10_000.times do
      time = Time.current
      array << {
        title: Faker::Book.title,
        author_id: 1 + rand(100),
        publisher_id: 1 + rand(100),
        genre_id: 1 + rand(100),
        updated_at: time,
        created_at: time
      }
    end
    Book.insert_all(array)
  end
end
