class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      
      t.timestamps
    end

    change_table :answers do |t|
      add_reference :answers, :question, foreign_key: true
      add_foreign_key :answers, :questions

      change_column_null :answers, :body, false
      change_column_null :answers, :correct, false

      change_column_default :answers, :correct, false
    end
  end
end
