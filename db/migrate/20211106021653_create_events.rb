# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :issue, foreign_key: true, null: false
      t.jsonb :payload, null: false

      t.timestamps
    end
  end
end
