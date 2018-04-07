class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :temperature, null: false
      t.string :location_name
      t.integer :unit, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
