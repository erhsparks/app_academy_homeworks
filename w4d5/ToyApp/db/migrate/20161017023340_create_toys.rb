class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name, null: false
      t.references :toyable, polymorphic: true, index: true

      t.index :name, unique: true

      t.timestamps null: false
    end
  end
end
