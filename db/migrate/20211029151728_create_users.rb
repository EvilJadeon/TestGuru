class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false

      t.references :test, foreign_key: { to_table: 'tests' }

      t.timestamps
    end
  end
end
