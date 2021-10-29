class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      
      t.timestamps
    end

    change_table :users do |t|
      add_reference :users, :test, foreign_key: true
      add_foreign_key :users, :tests
    end
  end
end
