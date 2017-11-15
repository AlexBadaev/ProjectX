class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lastname
      t.string :login
      t.string :password
      t.integer :statususer_id

      t.timestamps null: false
    end
  end
end
