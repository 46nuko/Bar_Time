class AddTagIdToBars < ActiveRecord::Migration[6.1]
  def change
    add_column :bars, :tag_id, :integer
  end
end
