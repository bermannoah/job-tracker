class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :taggings
  has_many :jobs, through: :taggings

  def to_s
    name
  end

end
