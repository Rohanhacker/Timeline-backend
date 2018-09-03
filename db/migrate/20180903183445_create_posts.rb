class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :message
      t.integer :recipient_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :posts, :recipient_id
  end
end
