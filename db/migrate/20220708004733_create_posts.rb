class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user,    null: false, foreign_key: true
      t.string :title,       null: false
      t.text :content,       null: false
      t.string :category_id, null: false
      t.string :link
      t.string :tag
      t.timestamps
    end
  end
end
