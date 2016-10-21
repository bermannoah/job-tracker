class RemoveJobFromCategories < ActiveRecord::Migration
  def change
    remove_foreign_key :categories, :jobs
  end
end
