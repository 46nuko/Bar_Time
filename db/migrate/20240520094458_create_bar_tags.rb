class CreateBarTags < ActiveRecord::Migration[6.1]
  def change
    create_table :bar_tags do |t|
      t.integer :bar_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
