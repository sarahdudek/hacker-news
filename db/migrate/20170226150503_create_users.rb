class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :username, :null => false
      t.string :hashed_password

      t.timestamps null: false
    end
    add_index :users, :username, :unique => true
  end
end
