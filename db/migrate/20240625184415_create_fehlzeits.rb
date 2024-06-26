class CreateFehlzeits < ActiveRecord::Migration[7.1]
  def change
    create_table :fehlzeits do |t|
      t.references :student, null: false, foreign_key: true
      t.references :veranstaltung, null: false, foreign_key: true
      t.datetime :datum
      t.text :begründung

      t.timestamps
    end
  end
end
