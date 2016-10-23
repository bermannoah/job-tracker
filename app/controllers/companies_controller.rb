class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  def index
    @companies = Company.all.order(:city)
    if params.include?("sort")
      render :city
    end
    if params.include?("location")
      @companies = Company.where(city: params["location"])
      render :location
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    company = Company.find(params[:id])
    redirect_to company_jobs_path(company)
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.delete

    flash[:success] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
