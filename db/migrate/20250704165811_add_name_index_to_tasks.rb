# frozen_string_literal: true

class AddNameIndexToTasks < ActiveRecord::Migration[8.0]
  def change
    add_index :tasks, :name, unique: true
  end
end
