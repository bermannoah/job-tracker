class DashboardController < ApplicationController
  
  def index
    @jobs = Job.all
    @companies = Company.all
    @jobs_by_level_of_interest_count = jobs_by_level_of_interest(@jobs)
    @level_of_interest_finder = Company.top_three_interests
  end
  
  def jobs_by_level_of_interest(jobs)
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