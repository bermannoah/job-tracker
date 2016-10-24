class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts
  
  def self.top_three_interests
    joins(:jobs).
    group(:name).
    order("AVG(jobs.level_of_interest) DESC").
    limit(3).
    pluck(:name, "AVG(jobs.level_of_interest)")
  end
  
  def self.jobs_by_level_of_interest(jobs)
    levels = []
    counts = Hash.new(0)
    jobs.each do |job|
      levels << job.level_of_interest
    end
    levels.each do |level|
      counts[level] += 1
    end
    counts.sort.reverse
  end
  
end
