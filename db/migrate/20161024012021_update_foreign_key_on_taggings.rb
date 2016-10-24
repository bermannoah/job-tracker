class UpdateForeignKeyOnTaggings < ActiveRecord::Migration
  def change
    remove_foreign_key :taggings, :jobs

    add_foreign_key :taggings, :jobs, on_delete: :cascade
  end
end
