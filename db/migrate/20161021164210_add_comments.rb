class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content

      t.timestamps null: false
    end
    
    add_reference :comments, :job, index: true, foreign_key: true
  end
end
