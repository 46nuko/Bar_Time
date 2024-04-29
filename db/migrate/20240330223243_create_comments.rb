class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :title
      t.integer :user_id, null: false
      t.integer :tag_id
      t.integer :bar_id
      t.timestamps
    end
  end
end
