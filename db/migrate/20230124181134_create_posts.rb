class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :CommentsCounter
      t.integer :LikesCounter
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
