SELECT
  book.id,
  book.title,
  author.name AS author_name,
  publisher.name AS publisher_name,
  genre.name AS genre_name,
  book.updated_at,
  book.created_at
FROM
  books as book
  INNER JOIN authors AS author ON author.id = book.author_id
  INNER JOIN publishers AS publisher ON publisher.id = book.publisher_id
  INNER JOIN genres AS genre ON genre.id = book.genre_id
ORDER BY
  book.id ASC
