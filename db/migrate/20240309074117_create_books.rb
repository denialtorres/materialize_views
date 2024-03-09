class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.belongs_to :author, null: false, foreign_key: true, type: :uuid
      t.belongs_to :publisher, null: false, foreign_key: true, type: :uuid
      t.belongs_to :genre, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
