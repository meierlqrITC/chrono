class CreateAnwesenheitslistes < ActiveRecord::Migration[7.1]
  def change
    create_table :anwesenheitslistes do |t|
      t.references :veranstaltung, null: false, foreign_key: true
      t.datetime :datum

      t.timestamps
    end
  end
end
