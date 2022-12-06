class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @jobs = Job.page(params[:page]).per(7)
    @jobs = @jobs.where("title ILIKE :title", title: "%#{params[:title]}%") if params[:title].present?
    @jobs = @jobs.where("city ILIKE :city", city: "%#{params[:city]}%") if params[:city].present?
    if params[:ft] || params[:pt] || params[:fl] || params[:is] || params[:ws]
      @filtered_jobs = []
      @filtered_jobs << @jobs.where(_type: params[:ft]) if params[:ft]
      @filtered_jobs << @jobs.where(_type: params[:pt]) if params[:pt]
      @filtered_jobs << @jobs.where(_type: params[:fl]) if params[:fl]
      @filtered_jobs << @jobs.where(_type: params[:is]) if params[:is]
      @filtered_jobs << @jobs.where(_type: params[:ws]) if params[:ws]
      @jobs = @filtered_jobs.flatten
    end

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
