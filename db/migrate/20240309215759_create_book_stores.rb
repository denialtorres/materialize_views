class CreateBookStores < ActiveRecord::Migration[7.0]
  def self.up
    create_view :book_stores, materialized: true

    # TABLE: book_stores
    # VIEW: book_stores
    # MATERIALIZED VIEW: book_stores - like a cache between the table and the view, only for reporting porpuses
  end

  def self.down
    drop_view :book_stores, materialized: true
  end
end
