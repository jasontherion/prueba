class CreateBilletes < ActiveRecord::Migration
  def change
    create_table :billetes do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
