class CreateVeranstaltungs < ActiveRecord::Migration[7.1]
  def change
    create_table :veranstaltungs do |t|
      t.string :name
      t.datetime :datum
      t.text :beschreibung
      t.references :modul, null: false, foreign_key: true

      t.timestamps
    end
  end
end
