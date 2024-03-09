class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :genre

  def self.search(query)
    return all unless query.present?

    # where(title: query)

    # where("title ILIKE ?", "%#{query}%")

    where("to_tsvector('english', title) @@ plainto_tsquery('english', :q)", q: query)
  end
end
