class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body
      
      t.timestamps
    end

    change_table :questions do |t|
      add_reference :questions, :test, foreign_key: true
      add_foreign_key :questions, :tests
      change_column_null :questions, :body, false
    end
  end
end
