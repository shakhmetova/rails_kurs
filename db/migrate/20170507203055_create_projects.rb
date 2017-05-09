class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.date :date_start, null: false
      t.date :date_finish, null: false
      t.integer :price, null: false

      t.timestamps null: false
    end

    add_index(:projects , [:name, :date_start], unique: true)

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE projects ADD CONSTRAINT chk_dates
          CHECK (date_finish >= date_start)"
        execute "ALTER TABLE projects ADD CONSTRAINT chk_price
          CHECK (price >= 0)"
      end
    end
  end
end
