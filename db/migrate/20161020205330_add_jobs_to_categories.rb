class AddJobsToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :job, index: true, foreign_key: true
  end
end
