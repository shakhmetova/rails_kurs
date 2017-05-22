class CreateDepartaments < ActiveRecord::Migration
  def change
    create_table :departaments do |t|
      t.string :name, unique: true, null: false

      t.timestamps null: false
    end

    add_index(:departaments, :name, unique: true)
  end
end
