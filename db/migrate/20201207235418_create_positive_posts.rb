class CreatePositivePosts < ActiveRecord::Migration
  def change
    create_table :positive_posts do |t|
      t.string :title
      t.string :text
      t.string :author
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
