class AddSuccessfullToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :successfull, :boolean, default: false
  end
end
