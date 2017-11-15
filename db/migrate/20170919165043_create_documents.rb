class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :about
      t.integer :type_system
      t.string :tegs
      t.text :largeabout
      t.text :listtodo
      t.text :authors
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
