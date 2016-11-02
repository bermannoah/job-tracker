class DashboardController < ApplicationController
  
  def index
    @jobs = Job.all
    @companies = Company.all
    @jobs_by_level_of_interest_count = Company.jobs_by_level_of_interest(@jobs)
    @level_of_interest_finder = Company.top_three_interests
  end
  
end