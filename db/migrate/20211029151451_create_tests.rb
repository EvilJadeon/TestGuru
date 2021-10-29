class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.string :author, null: false

      t.references :category, foreign_key: { to_table: 'categories' }
      t.references :user, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
