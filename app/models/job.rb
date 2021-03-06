class Job < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  
  
end
