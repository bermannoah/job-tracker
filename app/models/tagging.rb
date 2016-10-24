class Tagging < ActiveRecord::Base
  validates :tag_id, presence: true
  validates :job_id, presence: true

  belongs_to :tag
  belongs_to :job
end
