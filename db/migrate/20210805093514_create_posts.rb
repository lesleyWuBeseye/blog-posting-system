class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.timestamps
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
      t.references :article, foreign_key: { to_table: :posts }
    end
  end
end
