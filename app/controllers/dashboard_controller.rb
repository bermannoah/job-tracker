class DashboardController < ApplicationController
  
  def index
    @jobs = Job.all
    @companies = Company.all
  end
  
  def average_level_of_interest
    averages = @companies.map do |company|
      AVG(company.jobs.level_of_interest)
    end
  end
  
  
end