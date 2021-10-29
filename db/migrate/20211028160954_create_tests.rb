class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.string :author, null: false
      
      t.timestamps
    end

    change_table :tests do |t|
      add_reference :tests, :category, foreign_key: true
      add_foreign_key :tests, :categories

      add_reference :tests, :user, foreign_key: true
      add_foreign_key :tests, :users
    end
  end
end
