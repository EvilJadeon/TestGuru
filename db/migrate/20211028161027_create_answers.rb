class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false, default: false
      
      t.timestamps
    end

    change_table :answers do |t|
      add_reference :answers, :question, foreign_key: true
      add_foreign_key :answers, :questions
    end
  end
end
