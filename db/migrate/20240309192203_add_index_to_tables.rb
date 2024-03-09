class AddIndexToTables < ActiveRecord::Migration[7.0]
  def change
    add_index :books, "to_tsvector('english', title)", using: :gin
    add_index :authors, "to_tsvector('english', name)", using: :gin
    add_index :publishers, "to_tsvector('english', name)", using: :gin
    add_index :genres, "to_tsvector('english', name)", using: :gin
  end
end
