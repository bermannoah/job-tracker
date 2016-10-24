class UpdateForeignKeyOnComments < ActiveRecord::Migration
  def change
    remove_foreign_key :comments, :jobs

    add_foreign_key :comments, :jobs, on_delete: :cascade
  end
end