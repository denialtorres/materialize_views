# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_03_09_215759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "to_tsvector('english'::regconfig, (name)::text)", name: "index_authors_on_to_tsvector_english_name", using: :gin
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.bigint "author_id", null: false
    t.bigint "publisher_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "to_tsvector('english'::regconfig, (title)::text)", name: "index_books_on_to_tsvector_english_title", using: :gin
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["genre_id"], name: "index_books_on_genre_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "to_tsvector('english'::regconfig, (name)::text)", name: "index_genres_on_to_tsvector_english_name", using: :gin
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "to_tsvector('english'::regconfig, (name)::text)", name: "index_publishers_on_to_tsvector_english_name", using: :gin
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "genres"
  add_foreign_key "books", "publishers"

  create_view "book_stores", materialized: true, sql_definition: <<-SQL
      SELECT book.id,
      book.title,
      author.name AS author_name,
      publisher.name AS publisher_name,
      genre.name AS genre_name,
      book.updated_at,
      book.created_at
     FROM (((books book
       JOIN authors author ON ((author.id = book.author_id)))
       JOIN publishers publisher ON ((publisher.id = book.publisher_id)))
       JOIN genres genre ON ((genre.id = book.genre_id)))
    ORDER BY book.id;
  SQL
end
