class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true, on_delete: :nullify

      t.timestamps null: false
    end
  end
end
