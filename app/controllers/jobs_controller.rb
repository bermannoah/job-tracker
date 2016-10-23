class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company

  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
    @category_options = Category.all.map{ |c| [c.title, c.id ]}
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show 
    @comment = Comment.new
    @comments = @job.comments.all
  end

  def edit
    @category_options = Category.all.map{ |c| [c.title, c.id ]}
  end

  def update
    @category_options = Category.all.map{ |c| [c.title, c.id ]}
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job.id)
    else
      render :edit
    end  
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path
  end

  private
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
  
  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end
end
