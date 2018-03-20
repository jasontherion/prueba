class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :dni, :integer
    add_column :users, :address, :string
    add_column :users, :tel, :string

  end
end
