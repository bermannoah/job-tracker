class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :jobs, through: :taggings
  
  def job_with_tag_count
      taggings.count
  end
end