class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :rule

      t.timestamps
    end
  end
end
