class BookStore < ApplicationRecord
  self.primary_key = :id

  def readonly?
    true
  end

  include PgSearch::Model
  pg_search_scope :pg_search,
    against: [
      :title,
      :author_name,
      :publisher_name,
      :genre_name
    ],
    using: {
      tsearch: { dictionary: 'english' }
    }

  # pg_search_scope :pg_search,
  #                 against: :title,
  #                 using: {
  #                   tsearch: { dictionary: 'english' }
  #                 },
  #                 associated_against: {
  #                   author: :name,
  #                   publisher: :name,
  #                   genre: :name
  #                 }



  def self.search(query)
    return all unless query.present?

    pg_search(query)

    # where("to_tsvector('english', title) @@ plainto_tsquery('english', :q)", q: query)
    #       .joins(:author).or(Book.where("authors.name ILIKE ?", "%#{query}%"))
    #       .joins(:publisher).or(Book.where("publishers.name ILIKE ?", "%#{query}%"))
    #       .joins(:genre).or(Book.where("genres.name ILIKE ?", "%#{query}%"))

    # where(title: query)

    # where("title ILIKE ?", "%#{query}%")

    # where("to_tsvector('english', title) @@ plainto_tsquery('english', :q)", q: query)
  end
end