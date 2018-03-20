class CreateAtms < ActiveRecord::Migration
  def change
    create_table :atms do |t|
      t.datetime :fecha_retiro
      t.integer :valor_retiro
      t.integer :cliente_id

      t.timestamps null: false
    end
  end
end
