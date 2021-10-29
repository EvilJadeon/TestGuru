class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false, default: false

      t.references :answer, foreign_key: { to_table: 'answers' }

      t.timestamps
    end
  end
end
