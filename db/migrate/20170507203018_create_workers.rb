class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :fn, null: false
      t.string :ln, null: false
      t.string :sn
      t.string :passport_num, null: false
      t.string :passport_ser, null: false
      t.date :birthday, null: false
      t.string :post
      t.references :departament, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    add_index(:workers, [:passport_num, :passport_ser], unique: true)

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE workers ADD CONSTRAINT chk_ln
          CHECK (length(ln) >= 2)"
        execute "ALTER TABLE workers ADD CONSTRAINT chk_passport_num
          CHECK (length(passport_num) >= 4)"
        execute "ALTER TABLE workers ADD CONSTRAINT chk_passport_ser
          CHECK (length(passport_ser) >= 4)"
      end
    end

  end
end
