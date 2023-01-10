class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_user
  before_action :set_event, only: [:destroy]


  def index
    # @jobs = Job.page(params[:page]).per(7)
    @jobs = Job.all

    @jobs = @jobs.where("title ILIKE :title", title: "%#{params[:title]}%") if params[:title].present?
    @jobs = @jobs.where("city ILIKE :city", city: "%#{params[:city]}%") if params[:city].present?

    if params[:ft] || params[:pt] || params[:fl] || params[:is] || params[:ws]
      @filtered_jobs_type = []
      @filtered_jobs_type << @jobs.where(_type: params[:ft]) if params[:ft]
      @filtered_jobs_type << @jobs.where(_type: params[:pt]) if params[:pt]
      @filtered_jobs_type << @jobs.where(_type: params[:fl]) if params[:fl]
      @filtered_jobs_type << @jobs.where(_type: params[:is]) if params[:is]
      @filtered_jobs_type << @jobs.where(_type: params[:ws]) if params[:ws]
      arr = @filtered_jobs_type.flatten
      @jobs = Job.where(id: arr.map(&:id))
    end

    if params[:skills].present? && params[:skills] != "Choose..."
      @jobs = @jobs.where(category: params[:skills])
    end

    if params[:tn] || params[:sm] || params[:md] || params[:lg] || params[:xl] || params[:xxl]
      @filtered_jobs_company_size = []
      @filtered_jobs_company_size << @jobs.where(companySize: params[:tn]) if params[:tn]
      @filtered_jobs_company_size << @jobs.where(companySize: params[:sm]) if params[:sm]
      @filtered_jobs_company_size << @jobs.where(companySize: params[:md]) if params[:md]
      @filtered_jobs_company_size << @jobs.where(companySize: params[:lg]) if params[:lg]
      @filtered_jobs_company_size << @jobs.where(companySize: params[:xl]) if params[:xl]
      @filtered_jobs_company_size << @jobs.where(companySize: params[:xxl]) if params[:xxl]
      arr = @filtered_jobs_company_size.flatten
      @jobs = Job.where(id: arr.map(&:id))
    end

    if params[:os] || params[:rm] || params[:hy]
      @filtered_jobs_on_site = []
      @filtered_jobs_on_site << @jobs.where(onsite: params[:os]) if params[:os]
      @filtered_jobs_on_site << @jobs.where(onsite: params[:rm]) if params[:rm]
      @filtered_jobs_on_site << @jobs.where(onsite: params[:hy]) if params[:hy]
      arr = @filtered_jobs_on_site.flatten
      @jobs = Job.where(id: arr.map(&:id))
    end

  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = @job.id
    if @job.save
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @job.destroy
    redirect_to events_path, status: :see_other
  end

  def job_params
    params.require(:job).permit(:title, :_type)
  end

  def set_user
    @user = current_user
  end

  def set_job
    @job = Job.find(params[:job_id])
  end


end
