class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new()
    @contact.company_id = @company.id
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])

    if @job.update_attributes(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path
  end

  def analysis
    if params.keys.include?("sort")
      @sort_by = params[:sort]
      @jobs = Job.sort(@sort_by)
    elsif params.keys.include?("location")
      @sort_by = params[:location]
      @jobs = Job.jobs_in_city(@sort_by)
    end
  end

  def dashboard
    @jobs_by_interest = Job.by_interest
    @jobs_by_location = Job.by_location
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
