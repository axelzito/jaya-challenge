# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :action, null: false

      t.timestamps
    end
  end
end
