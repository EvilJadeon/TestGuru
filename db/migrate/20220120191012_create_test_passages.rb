class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :test, null: false, foreign_key: { on_delete: :cascade }
      t.references :current_question, foreign_key: { to_table: :questions }
      t.integer :correct_questions, default: 0

      t.timestamps
    end
  end
end
