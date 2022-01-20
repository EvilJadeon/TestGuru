class DropTableTestPassages < ActiveRecord::Migration[6.1]
  def change
    drop_table :test_passages, if_exists: true
  end
end
