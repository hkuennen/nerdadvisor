class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

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
      @jobs = @filtered_jobs_type.flatten
    end
    # if params[:tn] || params[:sm] || params[:md] || params[:lg] || params[:xl] || params[:xxl]
    #   @filtered_jobs_company_size = []
    #   @filtered_jobs_company_size << @jobs.where(companySize: params[:tn]) if params[:tn]
    #   @filtered_jobs_company_size << @jobs.where(companySize: params[:sm]) if params[:sm]
    #   @filtered_jobs_company_size << @jobs.where(companySize: params[:md]) if params[:md]
    #   @filtered_jobs_company_size << @jobs.where(companySize: params[:lg]) if params[:lg]
    #   @filtered_jobs_company_size << @jobs.where(companySize: params[:xl]) if params[:xl]
    #   @filtered_jobs_company_size << @jobs.where(companySize: params[:xxl]) if params[:xxl]
    #   @jobs = @filtered_jobs_company_size.flatten
    # end

  end

  def show
    @job = Job.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
