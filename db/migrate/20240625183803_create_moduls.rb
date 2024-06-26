class CreateModuls < ActiveRecord::Migration[7.1]
  def change
    create_table :moduls do |t|
      t.string :name
      t.text :beschreibung

      t.timestamps
    end
  end
end
