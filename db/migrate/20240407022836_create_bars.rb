class CreateBars < ActiveRecord::Migration[6.1]
  def change
    create_table :bars do |t|
      t.string :name, null: false
      t.string :address
      t.timestamps
    end
  end
end
