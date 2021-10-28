class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      
      t.timestamps
    end

    change_table :categories do |t|
      change_column_null :categories, :title, false
    end
  end
end
