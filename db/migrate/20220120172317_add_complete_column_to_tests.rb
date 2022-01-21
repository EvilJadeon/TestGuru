# frozen_string_literal: true

class AddCompleteColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :completed, :boolean, null: false, default: false
  end
end
