class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.integer :rule, null: false, default: 0

      t.timestamps
    end
  end
end
