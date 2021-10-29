class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.string :author
      
      t.timestamps
    end

    change_table :tests do |t|
      add_reference :tests, :category, foreign_key: true
      add_foreign_key :tests, :categories

      change_column_null :tests, :title, false
      change_column_null :tests, :level, false
      change_column_null :tests, :author, false

      change_column_default :tests, :level, 0
    end
  end
end
