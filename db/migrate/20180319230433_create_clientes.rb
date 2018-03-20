class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :user_id
      t.integer :total_cuenta
      t.string :id_tipo_cuenta
      t.datetime :consignacion_fecha
      t.integer :consignacion_valor

      t.timestamps null: false
    end
  end
end
