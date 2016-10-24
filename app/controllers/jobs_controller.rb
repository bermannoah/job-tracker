class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    if params.include?("sort")
      @jobs = Job.all.order(:level_of_interest).reverse
      render :interest
    else
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
      @contact = Contact.new
      @contacts = @company.contacts.all.order('created_at DESC')
    end
  end

  def new
    @job = Job.new()
    @category_options = Category.all.map{ |c| [c.title, c.id ]}
  end

  def create
    @category_options = Category.all.map{ |c| [c.title, c.id ]}
    @job = @company.jobs.new(job_params) 
    if @job.save
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show 
    @comment = Comment.new
    @comments = @job.comments.all.order('created_at DESC')
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
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id, :tag_list)
  end
end
