class AddContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :position
      t.string :email

      t.timestamps null: false
    end
    
    add_reference :companies, :contact, index: true, foreign_key: true
  end
end
